#!/usr/bin/env bash

date=$1

file="tmp_data.txt"

min=10
max=20

cat feed.txt |sort -R | sed -e "/^ *$/d" -e "s/ \+/ /g" |while read line
do 
	url=`echo $line |cut -d" " -f1`
	author=`echo $line |cut -d" " -f2`
	rand=`awk -v min=${min} -v max=${max} 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
	>&2 echo "sleep $rand ..."
	sleep $rand
	>&2 echo $url $author
	./urlcrawl.sh $url $author $date

done |sort -nr > $file

cp $file ./htmls/data/${date}.txt
