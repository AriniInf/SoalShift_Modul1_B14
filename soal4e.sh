#!/bin/bash

tambah=`echo $1 | awk -F: '{print $1}'`
#mengkonvert string ke int
tambah=`echo "$tambah" | bc`
tambah=$(($tambah-1))

#batas bawah (a jadi apa) huruf kecil
x=$((122-$tambah))
if [ $x -gt 122 ]
then
    x=97
fi
x=$(printf \\$(printf '%03o' $x))
#batas atas huruf kecil
y=$(printf '%d' "'$x")
y=$(($y-1))
if [ $y -lt 97 ]
then
    y=122
fi
y=$(printf \\$(printf '%03o' $y))

#batas bawah (A jadi apa) huruf besar
i=$((90-$tambah))
if [ $i -gt 90 ]
then
    i=65
fi
i=$(printf \\$(printf '%03o' $i))
#batas atas huruf besar
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

#and tinggal di shift dan save
cat "$1" | tr [a-z] ["$x"-za-"$y"] | tr [A-Z] ["$i"-ZA-"$j"] > "$hour:$min $day-$month-$year-decrip".txt
