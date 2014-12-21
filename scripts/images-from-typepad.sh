#!/bin/bash

if [ $# -ne 1]; then
	echo "$0 path-to-md-file"
	echo "Downloads all relevant images from avclub.com"
	exit 1
fi

cat $1 | grep -iE '^!\[' | cut -d'[' -f2 | cut -d']' -f1 | while read X; do
	wget -O $X.jpg http://acephalous.typepad.com/.a/${X}-800wi 
	JPG=$( file $X.jpg | grep JPEG 2>&1 > /dev/null ; echo $? )
	if [ $JPG -ne 0 ]; then
		mv $X.jpg $X.png -v
	fi
done

