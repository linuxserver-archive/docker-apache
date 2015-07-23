#!/bin/bash

if [ ! -e /usr/sbin/apache2 ]; then 
	echo "Not Installed"
else
  apt-get update
  apt-get upgrade
fi
