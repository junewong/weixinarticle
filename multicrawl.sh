#!/usr/bin/env bash

date=$1

file="tmp_data.txt"

cat feed.txt |sort -R | sed -e "/^ *$/d" -e "s/ \+/ /g" |while read line
do 
	url=`echo $line |cut -d" " -f1`
	author=`echo $line |cut -d" " -f2`
	>&2 echo $url $author
	./urlcrawl.sh $url $author $date
	rand=`awk -v min=5 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`
	>&2 echo "sleep $rand ..."
	sleep $rand

done |sort -nr > $file

cp $file ./htmls/data/${date}.txt
