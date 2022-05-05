# Docker-compose-backup-script
A simple script for backing up all Docker binds to one tar.gz file and moving it to a backup directory. 

Uses Docker Compose to pause containers. 

Easily run with crontab.

## docker-backup-as-user.sh
0 5 * * 5 su username -c "sh /scripts/backup.sh"

## docker-backup-as-root.sh
0 5 * * 5 /scripts/backup.sh
