#!/bin/sh

while inotifywait -e modify /config; do
    sv down /etc/service/reverseproxy/
    sv up /etc/service/reverseproxy/
    echo "File in Config Folder Changed, Restarted"
done
