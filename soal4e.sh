#!/bin/bash

tambah=`echo $1 | awk -F: '{print $1}'`
tambah=`echo "$tambah" | bc`
tambah=$(($tambah-1))

x=$((122-$tambah))
if [ $x -gt 122 ]
then
    x=97
fi
x=$(printf \\$(printf '%03o' $x))
y=$(printf '%d' "'$x")
y=$(($y-1))
if [ $y -lt 97 ]
then
    y=122
fi
y=$(printf \\$(printf '%03o' $y))

i=$((90-$tambah))
if [ $i -gt 90 ]
then
    i=65
fi
i=$(printf \\$(printf '%03o' $i))
j=$(printf '%d' "'$i")
j=$(($j-1))
if [ $j -lt 65 ]
then
    j=90
fi
j=$(printf \\$(printf '%03o' $j))

hour=`echo $1 | awk -F: '{print $1}'`
min=`echo $1 | awk '{print $1}' | awk -F: '{print $2}'`
day=`echo $1 | awk '{print $2}' | awk -F- '{print $1}'`
month=`echo $1 | awk '{print $2}' | awk -F- '{print $2}'`
year=`echo $1 | awk '{print $2}' | awk -F- '{print $3}' | awk -F. '{print $1}'`

cat "$1" | tr [a-z] ["$x"-za-"$y"] | tr [A-Z] ["$i"-ZA-"$j"] > "$hour:$min $day-$month-$year-decrip".txt
