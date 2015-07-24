#!/bin/bash

if [ ! "$(id -u abc)" -eq "$PUID" ]; then usermod -o -u "$PUID" abc ; fi
if [ ! "$(id -g abc)" -eq "$PGID" ]; then groupmod -o -g "$PGID" abc ; fi
chown -R abc:abc /etc/apache2/
chown -R abc:abc /var/www/

echo "
-----------------------------------
GID/UID
-----------------------------------
User uid:    $(id -u abc)
User gid:    $(id -g abc)
-----------------------------------
"
