![http://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/ReverseProxy

Apache reverse proxy is a webserver.  This docker is setup for easy use of the reverse proxy feature of Apache which allows you to redirect traffic.  For example instead of going to www.domain.com:8351 for a service, you can go direct to www.domain.com/service and also enable HTTPS.

## Usage

```
docker create --name="Proxy" -p 80:80 -p 443:443 -v /path/to/www:/web -v /path/to/proxy:/config linuxserver/Reverseproxy
```

**Parameters**

* `-p 80, 443` - the port(s)
* `-v /etc/localhost` for timesync - *optional*
* `-v /etc/apache2/` - Location for reverse proxy files
* `-v /var/www/` - Location for files to be served by webserver
* `-e PGID` for for GroupID - see below for explanation - *optional*
* `-e PUID` for for UserID - see below for explanation - *optional*

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it Proxy /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application 

Place files for web in /web folder and edit the files in /proxy for the reverse proxy.

## Updates

* Upgrade to the latest version simply `docker restart reverseproxy`.
* To monitor the logs of the container in realtime `docker logs -f reverseproxy`.


**Credits**

* smdion <smdion@gmail.com>

**Versions**

* 1.0
