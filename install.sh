#!/bin/bash

logFile=~/nas_installation.log

echo "Expanding the partition to fill the SD card" | tee $logFile
sudo raspi-config --expand-rootfs | tee -a $logFile
echo "Setting the default boot option to console, so no UI" | tee -a $logFile
sudo systemctl set-default multi-user.target
sudo cp /usr/share/zoneinfo/Europe/Bratislava > /etc/localtime

echo "Installing packages" | tee -a $logFile
sudo apt-get update | tee -a $logFile
sudo apt-get upgrade | tee -a $logFile
sudo apt-get install git samba samba-common screen youtube-dl hdparm ntfs-3g --force-yes --yes | tee -a $logFile
echo "Installing the custom scripts" | tee -a $logFile
cd ~
git clone https://github.com/vladonemo/my-raspberry-nas | tee -a $logFile
cd ./my-raspberry-nas/home/pi/backup/scripts/
sudo ./restoreSystem.sh backup_sys.lst ~/my-raspberry-nas / | tee -a $logFile
sudo mkdir -p /media/USBHDD_Main | tee -a $logFile
sudo mkdir -p /media/USBHDD_Backup | tee -a $logFile
sudo mkdir -p /media/USBHDD_Media | tee -a $logFile

sudo bash -c "echo 100000 > /proc/sys/fs/inotify/max_user_watches"

sudo useradd -g users adamcek | tee -a $logFile
sudo smbpasswd -a adamcek

echo "Please reboot the raspberry to apply the changes"
