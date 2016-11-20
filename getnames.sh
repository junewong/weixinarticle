#!/bin/bash

cat feed.txt |grep -Ev " [^ ]+" |while read url
do
	name=`./accountname.sh "$url"`
	echo "$url $name"
done

