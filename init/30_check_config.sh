#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /etc/apache2/sites-available/000-default.conf ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /defaults/000-default.conf /etc/apache2/sites-available/000-default.conf
fi
