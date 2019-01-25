#!/bin/bash
array=('quiet_song.jpg' 'moon_ocean.jpg')
length=${#array[*]}

file=~/.config/i3/current.txt
current=`cat $file`

let current+=1
if [ $current -ge $length ]
then
    current=0
fi

echo $current > $file

/bin/feh --bg-scale ~/.config/i3/${array[$current]}
