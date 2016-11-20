#!/bin/bash

url=$1
crawler "$url" ".profile_photo_img" "alt"
