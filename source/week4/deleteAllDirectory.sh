#!/bin/bash
FILE_LIST=*

for FILE in $FILE_LIST;
	do
		if [ -d $FILE ]; then
			rmdir $FILE	 
		fi
	done	