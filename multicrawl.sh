#!/usr/bin/env bash

cat feed.txt | sed -e "/^ *$/d" -e "s/ .*$//g" |xargs -I {} ./urlcrawl.sh {} |sort -nr |tee origin_contet.txt
