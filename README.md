# my-raspberry-nas

This is a set of scripts to setup my Raspberry Pi as a simple NAS+media server.
It is currently hardcoded to suite my needs (e.g. HDD UIDs, content folders, etc)

To install the NAS, simply run the following:
```bash
wget -Nnv https://raw.githubusercontent.com/vladonemo/my-raspberry-nas/master/install.sh && bash install.sh
```

Features:
- minidlna used as a media streaming option
- creating the videos root folder picking the video files from various locations (better ornanizaion in minidlna)
- samba shares for all content folders
- backup scripts for both full and incremental backups
- backing up camera snapshots from my office cam
