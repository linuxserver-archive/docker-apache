[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/apache
[![](https://images.microbadger.com/badges/image/linuxserver/apache.svg)](http://microbadger.com/images/linuxserver/apache "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/apache.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/apache.svg)][hub][![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io/linuxserver-apache)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io/job/linuxserver-apache/)
[hub]: https://hub.docker.com/r/linuxserver/apache/

This is an apache web server docker with reverse proxy services enabled.  Reverse proxy gives the ability going to www.domain.com:8351 for a service, you can go direct to www.domain.com/service and also enable HTTPS.

[![apache](http://www.softaculous.com/website/images/ampps/apache.png)][apacheurl]
[apacheurl]: https://httpd.apache.org/

## Usage

```
docker create \
--name="apache" \
-p 80:80 -p 443:443 \
-v /path/to/config:/config \
linuxserver/apache
```

**Parameters**

* `-p 80, 443` - the port(s)
* `-v /config/` - Location for reverse proxy files. Contains log, www, keys and apache folder
* `-e PGID` for for GroupID - see below for explanation - *optional*
* `-e PUID` for for UserID - see below for explanation - *optional*

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it apache /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

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
