#!/usr/bin/env bash

file="origin_contet.txt"

cat feed.txt | sed -e "/^ *$/d" -e "s/ \+/ /g" |while read line
do 
	url=`echo $line |cut -d" " -f1`
	author=`echo $line |cut -d" " -f2`
	./urlcrawl.sh $url $author

done |sort -t "^" -k2 -nr > $file
