#!/bin/bash

backupDir='/var/minecraft/backups'
currentDate=$(date +%b-%d-%Y-%H%M%Z)

find $backupDir -mtime +7 -exec rm -f {} \;

for sqlDatabase in $(mysql -Be 'show databases' | grep -Ev 'Database|mysql|*_schema')
do
  mysqldump --databases $sqlDatabase --lock-tables=false | gzip > $backupDir/sql/$sqlDatabase-$currentDate.sql.gz
  aws --profile default s3 cp --no-progress $backupDir/sql/$sqlDatabase-$currentDate.sql.gz s3://svmc-prod-backups-sql/
done

find /var/minecraft/server -name *.jar > tempignore.txt

tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/server/server-$currentDate.tar.gz  /var/minecraft/server
aws --profile default s3 cp --no-progress $backupDir/server/server-$currentDate.tar.gz s3://svmc-prod-backups-server/

aws --profile default s3 ls s3://svmc-prod-backups-server | while read -r remoteBackup
do
  if [[ $(date -d $(echo $remoteBackup | awk '{ print $1 }') +%s) > $(date -d "$(date) - 7 days" +%s) ]]
    then
      aws--profile default s3 rm s3://svmc-prod-backups-server/$(echo $remoteBackup | awk '{ print $4 }')
    fi
done

aws --profile default s3 ls s3://svmc-prod-backups-sql| while read -r remoteBackup
do
  if [[ $(date -d $(echo $remoteBackup | awk '{ print $1 }') +%s) > $(date -d "$(date) - 7 days" +%s) ]]
    then
      aws--profile default s3 rm s3://svmc-prod-backups-sql/$(echo $remoteBackup | awk '{ print $4 }')
    fi
done

rm -f tempignore.txt
