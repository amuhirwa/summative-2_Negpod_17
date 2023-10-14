#!/bin/bash

#remote server details

remote_host="b3649555e158.bd99d0d4.alu-cod.online"
remote_username="b3649555e158"
remote_password="49dec70ea41ec36111d5"
remote_location="/summative/0923-2023S"

directory="backup_dir"

scp -r $directory $remote_username@$remote_host:$remote_location
echo "Backup done successfully"
