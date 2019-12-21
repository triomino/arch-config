#!/bin/bash
array=('nintendo/0.jpg' 'nintendo/1.jpg' 'nintendo/2.jpg' 'nintendo/3.jpg', 'nintendo/4.jpg')
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
