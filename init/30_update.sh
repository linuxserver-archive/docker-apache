#!/bin/bash

apt-get update -qq
apt-get --only-upgrade install -yqq apache2
chown -R abc:abc /etc/apache2
