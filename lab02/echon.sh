#!/bin/sh

if (($# != 2))
then
	echo 'Usage: ./echon.sh <number of lines> <string>'
	exit 
fi	


if ! [[ "$1" =~ ^[1-9][0-9]+$|^0$ ]]
then 
	echo "./echon.sh: argument 1 must be a non-negative integer"
	exit
else
	number=$1
fi

number=$1
while ((number > 0))
do
     echo $2
     let number=$((number-1))
done


