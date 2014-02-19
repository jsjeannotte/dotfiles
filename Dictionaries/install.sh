#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

TARGET=/Library/Dictionaries/
cp *.tgz $TARGET
cd $TARGET
tar zxvf *.tgz
rm $TARGET/*.tgz