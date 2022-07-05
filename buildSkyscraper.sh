#!/bin/bash

echo "Eingabe höhe Github Skyline: "
read height

echo -e "Skyline">skyline.txt

git add .
git commit -m "build Github Skyline"
git push
