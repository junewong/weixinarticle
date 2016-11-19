#!/usr/bin/env bash

date=$1

file="origin_contet.txt"

cat feed.txt | sed -e "/^ *$/d" -e "s/ \+/ /g" |while read line
do 
	url=`echo $line |cut -d" " -f1`
	author=`echo $line |cut -d" " -f2`
	./urlcrawl.sh $url $author $date

done |sort -t "^" -k2 -nr > $file
