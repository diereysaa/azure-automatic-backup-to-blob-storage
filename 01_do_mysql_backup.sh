#!/bin/bash

# Variables
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="xxxxxxxxxxx-$DATE.sql"

echo "=============================================="
echo "=[ Starting DB backup - $(date +'%Y-%m-%d %H:%M:%S') ]="
echo "=============================================="

# Make backup
mysqldump --defaults-extra-file=~/.config/mysql.cnf xxxxxxxxxxx > $BACKUP_FILE
# The "--defaults-extra-file" is there in order to avoid warnings 
# from mysqldump because we're using the DB password on the command line
#
# Contents of ~/.config/mysql.cnf
# [client]
# user = "YOUR_USERNAME"
# password = "YOUR_PASSWORD"
# host = "YOUR_HOST"

# Check if backup was correctly created
if [ $? -eq 0 ]; then
  echo "Backup created correctly: $BACKUP_FILE"
else
  echo "Error creating backup"
fi

echo "==========================================="
echo "=[ DB backup ended - $(date +'%Y-%m-%d %H:%M:%S') ]="
echo "==========================================="
