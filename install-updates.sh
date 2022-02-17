#!/bin/bash

rsync -Ir --remove-source-files /var/minecraft/pending-updates/* /var/minecraft/server/plugins/
find /var/minecraft/pending-updates/* -depth -type d -empty -delete

exit 0
