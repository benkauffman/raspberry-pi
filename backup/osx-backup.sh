#!/bin/bash
#RUN AS ROOT!
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

millis=$(date +%s)
mkdir -p ~/backups/pi/

# diskutil list
echo "gzipping sd card to ~/backups/pi/pi-$millis.gz"
dd if=/dev/rdisk2 bs=1m | gzip > ~/backups/pi/pi-$millis.gz