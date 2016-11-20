#!/usr/bin/env bash

url=$1
author=$2
date=$3
if [[ "$date" = "" ]];then
	date=`date +"%Y-%m-%d"`
fi

crawler "$url" "a.question_link, .timestamp"  \
	| tr -d "\n"  \
	| sed -e"s/<\/span>/\n/g" -e 's/href="/>/g' -e 's/" target/</g' -e "s/<[^>]\+>/^/g"  \
	| sed -e "s/^ *\^//" -e "s/\^\^/^/g" \
	| grep "$date" \
	| sed "s#^#http://chuansong.me#" \
	| sed "s/\^/\^$author\^/"
