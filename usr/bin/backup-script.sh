DIRECTORY_TO_BACKUP=$1
ARCHIVE_NAME=$2
BACKUP_DIR=/media/USBHDD_Backup/Backup/$ARCHIVE_NAME
DATE=`date +%Y-%m-%d-%s`

if [ "$3" = "incremental" ]; then
    OUT_FOLDER=$BACKUP_DIR/last
    OUT_FILE=$OUT_FOLDER/$DATE-incremental.tar
else
    OUT_FOLDER=$BACKUP_DIR/temp
    OUT_FILE=$OUT_FOLDER/$DATE-full.tar
fi

pushd $DIRECTORY_TO_BACKUP/.. > /dev/null
mkdir -p $OUT_FOLDER
tar -cpvf - --listed-incremental $OUT_FOLDER/incremental-list.snar `basename $DIRECTORY_TO_BACKUP` --no-check-device | split -d -b 1G -a 3 - $OUT_FILE
popd

if [ "$3" != "incremental" ]; then
    # roll the backups if not doing incremental backup
    echo rolling the backups ...

    rm -rfv $BACKUP_DIR/previous.2
    if [ -d $BACKUP_DIR/previous.1 ]; then
        mv -v $BACKUP_DIR/previous.1 $BACKUP_DIR/previous.2
    fi
    if [ -d $BACKUP_DIR/last ]; then
        mv -v $BACKUP_DIR/last $BACKUP_DIR/previous.1
    fi
    mv -v $BACKUP_DIR/temp $BACKUP_DIR/last
fi
