#!/bin/bash
echo 'Running'
variable=$(speedtest-cli)

download=$(echo "$variable" | grep "ERROR: <urlopen error [Errno -3] Temporary failure in name resolution>")

number_download=$(echo "$(echo "$download" | tr -dc '0-9')" | rev | cut -c3- | rev)

error =$(echo "$variable" | grep Download)

echo "$number_download"

if [ $number_download  -gt 70 ]
then
       echo "--------------------------------------" >> high.txt
        echo "$variable" | grep Download >> high.txt
        echo "$variable" | grep Upload >> high.txt
        echo $(date) >> high.txt
elif[ $variable ]; then 
        echo "---------------------------------------" >> log.txt
        echo "INTERNET CONNECTION LOST !!"  >> log.txt
        echo $(date) >> log.txt
else
        echo "---------------------------------------" >> log.txt
        echo "$variable" | grep Download >> log.txt
        echo "$variable" | grep Upload  >> log.txt
        echo $(date) >> log.txt
fi
