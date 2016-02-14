#!/bin/bash

i3status --config ~/.i3/i3_status.conf | while :
do
    read line
    LG=$(xkb-switch)
    if [ $LG == "us" ]
    then
        dat="[{ \"full_text\": \"EN\", \"color\":\"#ffcc00\" },"
    else
        dat="[{ \"full_text\": \"CZ\", \"color\":\"#1a75ff\" },"
    fi
    echo "${line/[/$dat}" || exit 1
done
