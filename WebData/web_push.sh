#!/bin/bash

for x in `cat file`
do
	echo "Connecting to $x"
	echo
	sleep 1
	echo "Pushing Script File To $x"
	scp website_setup.sh devops@$x:/tmp/
	echo
	sleep 1
	echo "Executing Script File At $x"
	ssh devops@$x sudo /tmp/website_setup.sh
	sleep 1
	echo "Script File Executed At $x"
	echo
	echo "Removing Executed Script"
	ssh devops@$x sudo rm -rf /tmp/website_setup.sh
	echo "FINISHED"
done
