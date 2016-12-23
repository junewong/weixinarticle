#!/usr/bin/env bash

url=$1
author=$2
date=$3
if [[ "$date" = "" ]];then
	date=`date +"%Y-%m-%d"`
fi

#proxy="-x http://211.153.17.151:80"
proxy=""

#curl --connect-timeout 5 $proxy "$url" |crawler "a.question_link, .timestamp"  \
crawler "$url" "a.question_link, .timestamp"  \
	| tr -d "\n"  \
	| sed -e"s/<\/span>/\n/g" -e 's/href="/>/g' -e 's/" target/</g' -e "s/<[^>]\+>/^/g"  \
	| sed -e "s/^ *\^//" -e "s/\^\^/^/g" \
	| grep "$date" \
	| sed "s#^#http://chuansong.me#" \
	| sed "s/\^/\^$author\^/"
