#!/bin/bash

if [ ! -e /usr/sbin/apche2 ]; then 
	echo "Installed"
else
  apt-get update
  apt-get upgrade
fi
