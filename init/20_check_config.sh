#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/apache2/proxy-config.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /defaults/000-default.conf /config/proxy-config.conf
  chown abc:abc /config/apache2/sites-available/000-default.conf
fi
