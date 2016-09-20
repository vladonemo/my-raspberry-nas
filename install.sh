#!/bin/bash

repParent="/home/pi"
logFile=$repParent/nas_installation.log

echo "Expanding the partition to fill the SD card" | tee $logFile
sudo raspi-config --expand-rootfs | tee -a $logFile
echo "Setting the default boot option to console, so no UI" | tee -a $logFile
sudo systemctl set-default multi-user.target
sudo cp /usr/share/zoneinfo/Europe/Bratislava > /etc/localtime

echo "Installing packages" | tee -a $logFile
sudo apt-get update --force-yes --yes | tee -a $logFile
sudo apt-get upgrade --force-yes --yes | tee -a $logFile
sudo apt-get install git minidlna samba samba-common smbclient screen youtube-dl hdparm ntfs-3g binutils libexpat1-dev libc6 --force-yes --yes | tee -a $logFile

echo "Getting the custom scripts from github" | tee -a $logFile
cd $repParent
git clone https://github.com/vladonemo/my-raspberry-nas | tee -a $logFile

echo "First part of installing Plex Media Server" | tee -a $logFile
sudo mkdir -p /usr/lib/plexmediaserver
bash $repParent/my-raspberry-nas/installPlex.sh
sudo adduser --quiet --system --shell /bin/bash --home /var/lib/plexmediaserver plex
sudo chown plex -R /usr/lib/plexmediaserver

echo "Installing the custom scripts" | tee -a $logFile
cd $repParent/my-raspberry-nas/home/pi/backup/scripts/
sudo ./restoreFiles.sh list_nasFull.lst ~/my-raspberry-nas / | tee -a $logFile

sudo bash -c "echo 100000 > /proc/sys/fs/inotify/max_user_watches"
sudo locale-gen

echo "Further installation steps for Plex Media Server" | tee -a $logFile
sudo chown plex /etc/default/plexmediaserver
sudo chown plex /usr/sbin/start_pms
sudo chmod +x /usr/sbin/start_pms
sudo chmod +x /etc/init.d/plexmediaserver
sudo update-rc.d plexmediaserver defaults

sudo useradd -g users adamcek | tee -a $logFile
sudo smbpasswd -a adamcek

echo "Please reboot the raspberry to apply the changes"
