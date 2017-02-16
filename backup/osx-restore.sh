#!/bin/bash
#RUN AS ROOT!
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

echo "Please select the file from the list"
cd ~/backups/pi/
files=$(ls *.gz)
i=1

for j in $files
do
echo "$i. $j"
file[i]=$j
i=$(( i + 1 ))
done

echo "Enter number"
read input
filename=${file[$input]}
echo "Restoring from file $filename"

diskutil unmountDisk /dev/disk2
gzip -dc ~/backups/pi/$filename | dd of=/dev/rdisk2 bs=1m