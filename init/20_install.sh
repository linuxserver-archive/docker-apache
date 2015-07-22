#!/bin/bash

# Enable proxy
a2enmod proxy proxy_http proxy_ajp rewrite deflate substitute headers proxy_balancer proxy_connect proxy_html ssl xml2enc 
service apache2 restart
rm -R -f /var/www
ln -s /web /var/www

# Update apache configuration with this one
mv /etc/apache2/sites-available/000-default.conf /etc/apache2/000-default.conf
rm /etc/apache2/sites-available/*
rm /etc/apache2/apache2.conf
ln -s /config/proxy-config.conf /etc/apache2/sites-available/000-default.conf
ln -s /var/log/apache2 /logs

cp /defaults/apache2.conf /etc/apache2/apache2.conf
cp /defaults/ports.conf /etc/apache2/ports.conf

# Manually set the apache environment variables in order to get apache to work immediately.
echo abc > /etc/container_environment/APACHE_RUN_USER
echo abc > /etc/container_environment/APACHE_RUN_GROUP
echo /var/log/apache2 > /etc/container_environment/APACHE_LOG_DIR
echo /var/lock/apache2 > /etc/container_environment/APACHE_LOCK_DIR
echo /var/run/apache2.pid > /etc/container_environment/APACHE_PID_FILE
echo /var/run/apache2 > /etc/container_environment/APACHE_RUN_DIR
