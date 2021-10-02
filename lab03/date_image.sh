#!/bin/sh

if (($# > 1))
then
	exit
fi

filename=$1

date=`ls -l $1`

echo $date

time=`echo $date | cut -d' ' -f6-8`

echo $time

convert -gravity south -pointsize 36 -draw "text 0,10 '$time'" $filename temporary_file.jpg