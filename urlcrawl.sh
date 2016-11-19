#!/usr/bin/env bash

url=$1
author=$2
today=`date +"%Y-%m-%d"`

crawler "$url" "a.question_link, .timestamp"  \
	| tr -d "\n"  \
	| sed -e"s/<\/span>/\n/g" -e 's/href="/>/g' -e 's/" target/</g' -e "s/<[^>]\+>/^/g"  \
	| sed -e "s/^ *\^//" -e "s/\^\^/^/g" \
	| grep "$today" \
	| sed "s#^#http://chuansong.me#" \
	| sed "s/^/$author\^/"
