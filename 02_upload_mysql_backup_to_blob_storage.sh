#!/bin/bash

# Get SQL filename
SQL_FILENAME=$(ls *.sql)

# Upload file
echo "======================================================"
echo "=[ Starting upload to storage - $(date +'%Y-%m-%d %H:%M:%S') ]="
echo "======================================================"

az storage blob upload --account-name [YOUR_ACCOUNT_NAME_HERE] --container-name [YOUR_CONTAINER_NAME_HERE] --name $SQL_FILENAME --file $SQL_FILENAME --account-key [YOUR_ACCOUNT_KEY_HERE]

# Check if backup was correctly created
if [ $? -eq 0 ]; then
  echo "File uploaded correctly: $SQL_FILENAME"
  rm $SQL_FILENAME
else
  echo "Error uploading file: $SQL_FILENAME"
fi

echo "==================================================="
echo "=[ Ended upload to storage - $(date +'%Y-%m-%d %H:%M:%S') ]="
echo "==================================================="
echo " "
