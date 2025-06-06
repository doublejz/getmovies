#!/bin/bash
temp=/mnt/disk1/Media/movies.tmp
csv=/mnt/disk1/Media/movies.csv

ls -l --time-style="+%m-%d-%Y" /mnt/disk*/Media/Movies/ | tr -s " " "," | awk -F "," '{for(i=6;i<=NF;i++) printf $i" "; print ""}' > $temp ; sed -i 's/^\(.\{10\}\)./\1,/' $temp; sed -i 's/\\//g' $temp; sed -i 's/ (/,/g' $temp; sed -i 's/).mkv//g' $temp; sed -i '/^\s*$/d' $temp

sed -i '1 i\Downloaded, Name, Release Year' $temp

mv $temp $csv
