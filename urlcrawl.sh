#!/usr/bin/env bash

url=$1
today=`date +"%Y-%m-%d"`
crawler "$1" ".feed_item h2" |grep $today |html2text |sed "s/ *分享$//g" |sed -e "s/^## *\[ \([^\[]\+\) \](\([^)]\+\)) \+\([^ ]\+\)$/\2^\1^\3/g"  |sed -e "/^ *$/d" -e "s#^#http://chuansong.me#g"
