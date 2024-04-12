#!/bin/sh

# INSTALL AT
sudo apt install at

# COPY BACKUP SCRIPT
sudo cp backup.sh /usr/bin/
chmod +x /usr/bin/backup.sh

# COPY DAEMON
cp mrm_auto_backup.service /etc/systemd/system/
chmod +x /etc/systemd/system/mrm_auto_backup.service

# START DAEMON
sudo systemctl daemon-reload
sudo systemctl start mrm_auto_backup.service
sudo systemctl enable mrm_auto_backup.service
sudo systemctl status mrm_auto_backup.service
