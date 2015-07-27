#!/bin/sh

while inotifywait -e modify /etc/apache2/sites-available/; do
/usr/sbin/apache2ctl stop
/usr/sbin/apache2ctl -D FOREGROUND &
    echo "File in Config Folder Changed, Restarted"
done
