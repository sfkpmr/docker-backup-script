#!/bin/bash
#Docker bind backup script - if user has full ownerships in both /docker and backup directory.

#Exit immediately if a pipeline returns a non-zero status - https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -e

DATE=$(date '+%Y-%m-%d')

DOCKERCOMPOSEFILE=/docker/docker-compose.yml
BACKUPPATH="/mnt/backups/servers/${HOSTNAME}/"
BACKUPNAME="${HOSTNAME}-${DATE}.tar.gz"

cd $HOME

#Pause containers, backup and unpause containers
#The -f option should directly precede the filename. So, use tar -vczf filename.tar.gz instead of -vcfz
docker-compose -f "${DOCKERCOMPOSEFILE}" pause && tar -zvcpf "$BACKUPNAME" /docker/ && cp ${BACKUPNAME} ${BACKUPPATH} && rm -f "$BACKUPNAME"
docker-compose -f "${DOCKERCOMPOSEFILE}" unpause
