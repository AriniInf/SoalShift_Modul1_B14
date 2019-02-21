#!/bin/bash

#mengambil jam dijalankannya command
tambah=`date "+%X" | awk -F: '{print $1}'`
#mengkonvert string ke int
tambah=`echo "$tambah" | bc`

#batas bawah (a jadi apa) huruf kecil
x=$(($tambah+97))
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
i=$(($tambah+65))
i=$(printf \\$(printf '%03o' $i))
#batas atas huruf besar
j=$(printf '%d' "'$i")
j=$(($j-1))
if [ $j -lt 65 ]
then
    j=90
fi
j=$(printf \\$(printf '%03o' $j))

hour=`date "+%X" | awk -F: '{print $1}'`
min=`date "+%X" | awk -F: '{print $2}'`
day=`date | awk '{print $3}'`
month=`date | awk '{print $2}'`
year=`date | awk '{print $6}'`

#and tinggal di shift dan save
cat /var/log/syslog | tr [a-z] ["$x"-za-"$y"] | tr [A-Z] ["$i"-ZA-"$j"] > "$hour:$min $day-$month-$year".txt
