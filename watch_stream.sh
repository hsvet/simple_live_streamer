#!/bin/bash

[ -e list.txt ] && rm list.txt

# Combine all flv files in the folder into one

loops=0

while :
do
        for f in ./segments/output_*.flv
        do
        	echo "file $f" >> list.txt
        done

	ffmpeg -y -f concat -safe 0 -i list.txt -c copy joined-out.flv && rm list.txt

	if [ $loops -gt 0 ]
	do
		vlc joined-out.flv
	done
	fi

	loops = loops + 1
	
	sleep 10
done

