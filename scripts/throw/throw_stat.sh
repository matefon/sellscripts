#!/bin/bash
if [ "$1" == "" ]; then
	v=1
else
	v="$1"
fi
file=stat$1.txt
#rm stat.txt
touch $file
for i in {0..90}
do
	d="$(./throw.sh silent $v $i)"
	#echo -e "$i\t$d" >> $file
	echo -e "$d" >> $file
done
echo "Stat is done."
exit
