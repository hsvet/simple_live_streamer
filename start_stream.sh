#!/bin/bash

rm *.flv
mkdir segments

ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+100,200 screen_capture.flv &
sleep 10

while :
do
	ffmpeg -i screen_capture.flv -map 0 -c copy -f segment -segment_time 10 ./segments/output_%03d.flv
	sleep 10
done

