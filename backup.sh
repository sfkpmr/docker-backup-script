#!/bin/bash
#Docker backup script

DATE=$(date '+%Y-%m-%d')

DOCKERCOMPOSEFILE=/docker/docker-compose.yml
BACKUPUSER=username # A user with permissions to use the backup path 
BACKUPPATH="/mnt/backups/servers/${HOSTNAME}/"
BACKUPNAME="${HOSTNAME}-${DATE}.tar.gz"

#Pause containers, backup and unpause containers
#The -f option should directly precede the filename. So, use tar -vczf filename.tar.gz instead of -vcfz
/usr/local/bin/docker-compose -f "${DOCKERCOMPOSEFILE}" pause && tar -zvcpf "$BACKUPNAME" /docker/ && sudo -u "$BACKUPUSER" cp "$BACKUPNAME" "${BACKUPPATH}" && rm -f "$BACKUPNAME"
/usr/local/bin/docker-compose -f "${DOCKERCOMPOSEFILE}" unpause
