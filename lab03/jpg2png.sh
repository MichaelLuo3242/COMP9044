#!/bin/sh



for name in *.jpg
do	
	jpg=`echo “$name” | egrep .jpg | sed 's/.jpg//g'`

	if [ -f "$jpg.png" ]
	then 
		echo $jpg.png already exists
		exit 1
	else
		convert "$jpg.jpg" "$jpg.png"
	fi
done
exit 0