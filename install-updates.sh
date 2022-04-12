#!/bin/bash

rsync -Ir --remove-source-files /var/minecraft/khavalon/pending-updates/* /var/minecraft/khavalon/plugins/
find /var/minecraft/khavalon/pending-updates/* -depth -type d -empty -delete

exit 0
