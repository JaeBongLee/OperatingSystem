#!/bin/bash

FILE_NAME="./dirname.txt"
if [ -e $FILE_NAME ]; then
	dirNameList="$(cat dirname.txt)"
	for dirName in $dirNameList 
	do
		if [ -z name ]; then
			exit 0
		else
			mkdir $dirName
		fi
	done
else
	echo "NO FILE EXIST ERROR"
fi