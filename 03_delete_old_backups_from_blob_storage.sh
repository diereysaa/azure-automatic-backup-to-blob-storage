#!/bin/bash

# Get blobs list
blobs=$(az storage blob list --account-name [YOUR_ACCOUNT_NAME_HERE] --container-name [YOUR_CONTAINER_NAME_HERE] --query "[?properties.lastModified < '$(date -d '-10 days' -u +"%Y-%m-%dT%H:%M:%SZ")'].name" -o tsv --account-key [YOUR_ACCOUNT_KEY_HERE])

# Delete older blobs
echo "==================================================="
echo "=[ Starting blobs deletion - $(date +'%Y-%m-%d %H:%M:%S') ]="
echo "==================================================="
for blob in $blobs
do
    echo "Deleting blob $blob"
    az storage blob delete --account-name [YOUR_ACCOUNT_NAME_HERE] --container-name [YOUR_CONTAINER_NAME_HERE] --name $blob --account-key [YOUR_ACCOUNT_KEY_HERE]
done
echo "================================================"
echo "=[ Ended blobs deletion - $(date +'%Y-%m-%d %H:%M:%S') ]="
echo "================================================"
echo " "
