#!/bin/sh

# CONFIG
paths_files=("/home/etc" "/home/")
backup_path="/"
days_to_next_backup=6

# CODE
# make backup path
date_time=$(date +”%m-%d-%Y_%H-%M”)
path="${backup_path}/backup-${date_time}"
mkdir -p $path

# backup paths and files
for path_file in ${paths_files[@]}; do
	cp -r $path_file $path
done

# plane next start
at now + ${days_to_next_backup} days <<EOF
bash /usr/bin/backup.sh
EOF

# update
apt update
apt upgrade
