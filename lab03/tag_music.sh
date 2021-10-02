#!/bin/sh

{
for path in "$@"
do
	if [ ! -d "$path" ]
	then
		exit 1
	fi

	album=`echo "$path" | cut -d'/' -f2`
	year=`echo "$path" | cut -d',' -f2 | sed 's/^\s*//'`', Genre: Unknown(255)'

	cd "$path"

	for music0 in *
	do
		# echo $music
		music=`echo $music0 | sed 's/ - /:/g'`
		title=`echo "$music" | cut -d':' -f2 | sed -e 's/^\s*//' -e 's/\s*$//'`
		# title=`echo "$music" | sed 's/ - /:/g' | cut -d':' -f2 | sed 's/^[ \t]*//g'`
		artist=`echo "$music" | cut -d':' -f3 | sed -e 's/^\s*//' -e 's/\s*$//'  | sed 's/.mp3//g'`
		track=`echo "$music"  | cut -d':' -f1`
		id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$music0"
	done
	cd -
done
} >>/dev/null

