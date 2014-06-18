#!/bin/bash

if [ "$(id -u)" != "0" ]; then
    echo "Sorry, you are not root."
    exit 1
fi

TARGET=/System/Library/QuickLook/
TARGET=/Library/QuickLook
cp *.zip $TARGET
cp *.tgz $TARGET
cd $TARGET
unzip *.zip
tar zxvf *.tgz
rm $TARGET/*.zip
rm $TARGET/*.tgz