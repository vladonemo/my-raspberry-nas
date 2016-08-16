ARCHIVE_TO_RESTORE=$1
RESTORE_DIR=/media/USBHDD_Backup/Backup/$ARCHIVE_TO_RESTORE
EXTRACT='tar --incremental -xvp'

cat $RESTORE_DIR/*full.tar | $EXTRACT

for i in `ls -r $RESTORE_DIR/*incremental.tar`; do cat $i | $EXTRACT; done;
