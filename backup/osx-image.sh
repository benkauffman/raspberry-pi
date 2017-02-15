millis=$(date +%s)
mkdir ~/backups/pi/

diskutil list
sudo dd if=/dev/rdisk1 of=~/backups/pi/pi-$millis.img bs=1m
sudo dd if=/dev/rdisk1 bs=1m | gzip > ~/backups/pi/pi-$millis.gz