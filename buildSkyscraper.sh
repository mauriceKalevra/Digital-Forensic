#!/bin/bash

function randomChange() {

	
	echo "Eingabe höhe Github Skyline: "
	read height

	l=15
	[ -n "$1" ] && l=$1
	[ -n "$2" ] && l=$(shuf --random-source=/dev/urandom -i $1-$2 -n 1)
	tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l} | xargs>skyline.txt

	git add .
	git commit -m "build Github Skyline"
	git push
}

randomChange
