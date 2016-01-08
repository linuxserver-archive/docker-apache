![https://linuxserver.io](http://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](http://linuxserver.io) team brings you another quality container release featuring auto-update on startup, easy user mapping and community support. Be sure to checkout our [forums](http://forum.linuxserver.io) or for real-time support our [IRC](http://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`.

# linuxserver/apache

This is an apache web server docker with reverse proxy services enabled.  Reverse proxy gives the ability going to www.domain.com:8351 for a service, you can go direct to www.domain.com/service and also enable HTTPS.

## Usage

```
docker create --name="apache" -p 80:80 -p 443:443 -v /path/to/config:/config linuxserver/apache
```

**Parameters**

* `-p 80, 443` - the port(s)
* `-v /config/` - Location for reverse proxy files. Contains log, www, keys and apache folder
* `-e PGID` for for GroupID - see below for explanation - *optional*
* `-e PUID` for for UserID - see below for explanation - *optional*

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it apache /bin/bash`.

### User / Group Identifiers

**TL;DR** - The `PGID` and `PUID` values set the user / group you'd like your container to 'run as' to the host OS. This can be a user you've created or even root (not recommended).

Part of what makes our containers work so well is by allowing you to specify your own `PUID` and `PGID`. This avoids nasty permissions errors with relation to data volumes (`-v` flags). When an application is installed on the host OS it is normally added to the common group called users, Docker apps due to the nature of the technology can't be added to this group. So we added this feature to let you easily choose when running your containers.

## Setting up the application 

* Config files are located in /config/apache
* Place web files in /config/www
* Place keys in /config/keys

## Updates

* Upgrade to the latest version simply `docker restart apache`.
* To monitor the logs of the container in realtime `docker logs -f apache`.


**Versions**

* 06-11-2015 - Initial Release
