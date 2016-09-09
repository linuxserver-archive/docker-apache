[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/index.php/irc/
[podcasturl]: https://www.linuxserver.io/index.php/category/podcast/

[![linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/apache
[![](https://images.microbadger.com/badges/image/linuxserver/apache.svg)](http://microbadger.com/images/linuxserver/apache "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/apache.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/apache.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io/linuxserver-nzbapache)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io/job/linuxserver-nzbapache/)
[hub]: https://hub.docker.com/r/linuxserver/apache/

This is an apache web server docker with reverse proxy services enabled.  Reverse proxy gives the ability going to www.domain.com:8351 for a service, you can go direct to www.domain.com/service and also enable HTTPS.

[![apache](http://www.softaculous.com/website/images/ampps/apache.png)][apacheurl]
[apacheurl]: https://httpd.apache.org/

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

* 09-09-16 - Add layer badges to README.
* 06-11-15 - Initial Release
