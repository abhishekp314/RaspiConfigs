#!/bin/sh

while [ 1 ]
do
	# Test internet
	wget -q --tries=1 --timeout=20 --spider https://www.google.com
	
	if [ $? -ne 0 ]; then
		# Auto login Selenium script
		echo "Running Auto Login script..."
		date
		pkill firefox
		pkill gecko
		
		python AutoLoginSel.py
	fi
	
	sleep 30
done