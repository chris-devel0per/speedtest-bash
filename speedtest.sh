#!/bin/bash
echo 'Running'
variable=$(speedtest-cli)

download=$(echo "$variable" | grep Download)

number_download=$(echo "$(echo "$download" | tr -dc '0-9')" | rev | cut -c3- | rev)
#download_number= $(echo "$download" | tr -dc '0-9')

#download_number_cut=$(echo "$download_number" | rev | cut -c3- | rev)

#echo "$download_number_cut"

echo "$number_download"

if [ $number_download  -gt 80 ]
then
        echo Hey that\'s a large number.
        pwd
fi

echo "---------------------------------------" >> log.txt
echo "$variable" | grep Download >> log.txt
echo "$variable" | grep Upload  >> log.txt
echo $(date) >> log.txt



