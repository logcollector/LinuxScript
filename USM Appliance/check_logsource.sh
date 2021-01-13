#!/bin/bash
#Check Log Source Status when the file is empty.

files=$(find /var/log/alienvault/devices -empty)


if [[ $files ]]; then
        echo "No logs collected from your devices, here we go"
        IFS=$'\n'
        for i in $(find /var/log/alienvault/devices -empty);
        do
                ls -la $i |awk '{print $6,$7,$8,$9}'
        done
        unset IFS

else
        echo "All Logs are Collected"
fi