#!/bin/bash

if [ $# -ne 1]; then
	echo "$0 path-to-md-file"
	echo "Downloads all relevant images from avclub.com"
	exit 1
fi

cat $1 | grep -iE '^!\[' | cut -d'[' -f2 | cut -d']' -f1 | while read X; do
	Y=$( echo $X | cut -c1-4 )
	Z=$( echo $X | cut -c5-6 )
	wget -O $X.jpg http://i.onionstatic.com/avclub/$Y/$Z/original/640.jpg
done

