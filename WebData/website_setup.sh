#!/bin/bash

Name='Opeyemi'

# Website Set-UP Code Link
web01_link="https://www.tooplate.com/zip-templates/2128_tween_agency.zip"
web02_link="https://www.tooplate.com/zip-templates/2123_simply_amazed.zip"
web03_link="https://www.tooplate.com/zip-templates/2108_dashboard.zip"

# Artifacts Zipped Files
artifat01="2128_tween_agency"
artifat02="2123_simply_amazed"
artifat03="2108_dashboard"

tmp_dir="/tmp/webfiles"

package="wget httpd zip unzip"
	
if [ $HOSTNAME = "web01" ]
then
	echo "Website Set-Up Running on $HOSTNAME"
	sleep 1
	echo "Installing Packages On $HOSTNAME"
	sudo yum install $package -y
	echo "Starting httpd On $HOSTNAME"
	sudo systemctl start httpd
	sudo systemctl enable httpd
	sleep 1
	echo "httpd Successfully Started on $HOSTNAME"
	echo
	echo "Creating Temporary Directory For Website Data"
	mkdir -p $tmp_dir
	cd $tmp_dir
	sudo wget $web01_link > /dev/null
	sudo unzip $artifat01.zip > /dev/null
	sleep 1
	echo "Copying Artifacts"
	sudo cp -r $artifat01/* /var/www/html
	echo "Files Copied Successfully"
	sudo systemctl restart httpd
	echo "httpd Restarted"
	
elif [ $HOSTNAME = "web02" ]
	then
	echo "Website Set-Up Running on $HOSTNAME"
	sleep 1
	echo "Installing Packages On $HOSTNAME"
	sudo yum install $package -y
	echo "Starting httpd on $HOSTNAME"
	sudo systemctl start httpd
	sudo systemctl enable httpd
	echo "httpd Successfully Started on $HOSTNAME"
	sleep 1
	echo "httpd Successfully Started on $HOSTNAME"
	echo
	echo "Creating Temporary Directory For Website Data"
	mkdir -p $tmp_dir
	cd $tmp_dir
	sudo wget $web02_link > /dev/null
	sudo unzip $artifat02.zip > /dev/null
	sleep 1
	echo "Copying Artifacts"
	sudo cp -r $artifat02/* /var/www/html
	echo "Files Copied Successfully"
	sudo systemctl restart httpd
	echo "httpd Restarted"

else
packages="wget apache2 zip"
	echo "This Is Ubuntu Machine"
	sudo apt update
	sleep 1
	echo "Website Set-Up Running on $HOSTNAME"
	sleep 1
	echo "Installing Packages On $HOSTNAME"
	sudo apt install $packages -y
	echo "Starting apache2 On $HOSTNAME"
	sudo systemctl start apache2
	sudo systemctl enable apache2
	sleep 1
	echo "apache2 Successfully Started on $HOSTNAME"
	echo
	echo "Creating Temporary Directory For Website Data"
	mkdir -p $tmp_dir
	cd $tmp_dir
	sudo wget $web03_link > /dev/null
	sudo unzip $artifat03.zip > /dev/null
	sleep 1
	echo "Copying Artifacts"
	sudo cp -r $artifat03/* /var/www/html
	echo "Files Copied Successfully"
	sudo systemctl restart apache2
	echo "Apache2 Restarted"

sleep 1
echo
echo "Congratulations $Name - Your Website Is Now Ready."

fi
