#!/bin/bash

if [ ! $# -eq "1" ]; then
    echo 'Invalid # of args'
    exit 1
fi

cat start.sh.tpl | sed "s/__VERSION__/$1/g" > workspace/start.sh
chmod +x workspace/start.sh