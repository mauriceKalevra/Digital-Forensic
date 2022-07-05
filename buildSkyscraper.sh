#!/bin/bash

function randomChange() {

	l=15
	[ -n "$1" ] && l=$1
	[ -n "$2" ] && l=$(shuf --random-source=/dev/urandom -i $1-$2 -n 1)
	tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l} | xargs>skyline.txt

	git add .
	git commit -m "build Github Skyline"
	git push
	sleep 5
}

function execTimes() {

	echo "Anzahl an Ausführungen :"
	read times

	for ((i=0; i<=$times;i++)); do
		randomChange
	done
}

execTimes
