#!/bin/sh

sort -r | while read -r path
do
    if [ -f "${path}" ] || [ -L "${path}" ]
    then
        echo "Removing file ${path}"
        rm -f "${path}"
    elif [ -z "$(ls -A "${path}")" ]
    then
        echo "Removing empty directory ${path}"
        rmdir "${path}"
    fi
done
