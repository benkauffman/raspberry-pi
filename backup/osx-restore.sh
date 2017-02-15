# echo "Please select the file from the list"

# files=$(ls *.txt)
# i=1

# for j in $files
# do
# echo "$i.$j"
# file[i]=$j
# i=$(( i + 1 ))
# done

echo "Enter number"
read input
echo "You select the file ${file[$input]}"

diskutil unmountDisk /dev/disk1
gzip -dc ~/backups/pi/pi-$millis.gz | sudo dd of=/dev/rdisk1 bs=1m