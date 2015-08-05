#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/proxy-config.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /defaults/000-default.conf /config/proxy-config.conf
  chown abc:abc /config/proxy-config.conf
fi

# Check if logs folder exists. If not, create
if [ -d /config/logs ]; then
  echo "Folder Exists."
else
  echo "Creating."
  /sbin/setuser abc mkdir -p /config/logs
fi
  
