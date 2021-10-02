#!/bin/sh

if (($# == 0)) 
then 
	# echo "wrong"
	exit
fi

for pngName in $@
do
	if ! [ -f "$pngName" ]
	then
		# echo $pngName " not exists"
		exit
	fi

	display “$pngName”
	echo "Address to e-mail this image to?"

	read address
	if ! [[ "$address" =~ ^[A-Za-z0-9]+\@[A-Za-z0-9]+\.[A-Za-z0-9]+.* ]]
	then
		# echo $address "wrong"
		exit
	# else
	# 	echo "right"
	fi

	echo "Message to accompany image?"
	read message

	# png=`echo $pngName | egrep .png | sed 's/.png//g'

	echo '$message' | mutt -s ' ' -e 'set copy=no' -a “$pngName” -- $address

done



