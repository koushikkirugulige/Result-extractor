#!/bin/bash
x=0
y=0,z=1
while [ $x -lt 2 ]
do
y=0
while [ $y -lt 10 ]
do
z=1
while [ $z -lt 10 ]
do
wget -o dum.txt -O file.html http://results.vtu.ac.in/results17/result_page.php?usn=1rn13me$x$y$z 

sed -i -e 's/<[^>]*>//g' file.html
sed -i -e 's/://g' file.html
sed '47q;d' file.html|grep -o '[0-9A-Za-z ]\+' >usn.txt
sed '51q;d' file.html|grep -o '[a-zA-Z0-9. ]\+' >name.txt
sed '180q;d' file.html |grep -o '[0-9]\+' >marks.txt
sed '184q;d' file.html |grep -o '[a-zA-Z0-9 ]\+' >desc.txt
pr -m -t -w 120  usn.txt name.txt marks.txt desc.txt >>final.txt
z=`expr $z + 1`
done
y=`expr $y + 1`
done
x=`expr $x + 1`
done 
