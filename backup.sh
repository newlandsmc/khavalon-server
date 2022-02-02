#!/bin/bash

backupDir='/var/minecraft/backups'
currentDate=$(date +%b-%d-%Y-%H%M%Z)

for sqlDatabase in $(mysql -Be 'show databases' | grep -Ev 'Database|mysql|*_schema')
do
  mysqldump --databases $sqlDatabase --lock-tables=false | gzip > $backupDir/$sqlDatabase-$currentDate.sql.gz
  aws --profile default s3 cp --no-progress $backupDir/$sqlDatabase-$currentDate.sql.gz s3://svmc-prod-backups-sql/
  rm -f $backupDir/$sqlDatabase-$currentDate.sql.gz
done

find /var/minecraft/server -name "*.jar" > tempignore.txt
echo "/var/minecraft/server/plugins/squaremap/web/tiles/" >> tempignore.txt

for world in $(ls /var/minecraft/server/worlds/)
do
  tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/server-$world-$currentDate.tar.gz  /var/minecraft/server/worlds/$world
  aws --profile default s3 cp --no-progress $backupDir/server-$world-$currentDate.tar.gz s3://svmc-prod-backups-server/
  rm -f $backupDir/server-$world-$currentDate.tar.gz
done

tar --exclude-from=tempignore.txt --warning=no-file-changed -czpf $backupDir/server-plugins-$currentDate.tar.gz  /var/minecraft/server/plugins
aws --profile default s3 cp --no-progress $backupDir/server-plugins-$currentDate.tar.gz s3://svmc-prod-backups-server/
rm -f $backupDir/server-plugins-$currentDate.tar.gz

aws --profile default s3 ls s3://svmc-prod-backups-server | while read -r remoteBackup
do
  if [[ $(date -d $(echo $remoteBackup | awk '{ print $1 }') +%s) > $(date -d "$(date) - 30 days" +%s) ]]
    then
      aws --profile default s3 rm s3://svmc-prod-backups-server/$(echo $remoteBackup | awk '{ print $4 }')
    fi
done

aws --profile default s3 ls s3://svmc-prod-backups-sql| while read -r remoteBackup
do
  if [[ $(date -d $(echo $remoteBackup | awk '{ print $1 }') +%s) > $(date -d "$(date) - 30 days" +%s) ]]
    then
      aws --profile default s3 rm s3://svmc-prod-backups-sql/$(echo $remoteBackup | awk '{ print $4 }')
    fi
done

rm -f tempignore.txt
