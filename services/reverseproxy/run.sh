#!/bin/bash

exec /sbin/setuser abc /usr/sbin/apache2 -D FOREGROUND
