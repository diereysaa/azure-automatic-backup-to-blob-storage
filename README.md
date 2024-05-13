# Azure utomatic backup to blob storage

This repository shows a simple way to create an automated backup system on Azure

---

### Preparation

First you need to create an account in Azure, and then a storage account. **[Note the name of the storage account]**

Inside the storage account, create a new blob container for the backups **[Note the name of the container]**

Then, inside the storage account go to "Access keys" on the sidebar and check your account key **[Note your account key]**

---

### Install Azure CLI

Here just login into the DB server, and execute this:
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

And once everything is installed, connect your account by doing:
```bash
az login
```

It will give you an URL and a code to login.

---

### Copy files and configure cronjobs

Copy the files on your server, and update the specific variables you've noted on preparation step. Also touch a log file:
```bash
touch backup.log
```

Then add a cronjob like this: 
```bash
0 19 * * * 01_do_mysql_backup.sh > backup.log
0 20 * * * 02_upload_mysql_backup_to_blob_storage.sh > backup.log
0 21 * * * 03_delete_old_backups_from_blob_storage.sh > backup.log
```
