ARCHIVE_TO_RESTORE=$1
EXTRACT_DIR=$2
RESTORE_DIR=/media/USBHDD_Backup/Backup/$ARCHIVE_TO_RESTORE
EXTRACT='tar --incremental -xvp -C '$2

echo Extracting $ARCHIVE_TO_RESTORE using the following arguments: $EXTRACT
cat $RESTORE_DIR/*full.tar* | $EXTRACT

for i in `ls $RESTORE_DIR/*incremental.tar*`; do cat $i | $EXTRACT; done;
