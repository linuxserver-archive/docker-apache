[linuxserverurl]: https://linuxserver.io
[forumurl]: https://forum.linuxserver.io
[ircurl]: https://www.linuxserver.io/irc/
[podcasturl]: https://www.linuxserver.io/podcast/
[appurl]: https://httpd.apache.org/
[hub]: https://hub.docker.com/r/linuxserver/apache/

[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)][linuxserverurl]

The [LinuxServer.io][linuxserverurl] team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io][forumurl]
* [IRC][ircurl] on freenode at `#linuxserver.io`
* [Podcast][podcasturl] covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# DEPRECATED, NO LONGER MAINTAINED AND/OR REFRESHED

# linuxserver/apache
[![](https://images.microbadger.com/badges/version/linuxserver/apache.svg)](https://microbadger.com/images/linuxserver/apache "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/linuxserver/apache.svg)](https://microbadger.com/images/linuxserver/apache "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/apache.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/linuxserver/apache.svg)][hub][![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Builders/x86-64/x86-64-apache)](https://ci.linuxserver.io/job/Docker-Builders/job/x86-64/job/x86-64-apache/)

This is an apache web server docker with reverse proxy services enabled.  Reverse proxy gives the ability going to www.domain.com:8351 for a service, you can go direct to www.domain.com/service and also enable HTTPS.

[![apache](http://www.softaculous.com/website/images/ampps/apache.png)][appurl]

## Usage

```
docker create \
--name="apache" \
-p 80:80 -p 443:443 \
-v /path/to/config:/config \
linuxserver/apache
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


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

## Info

* To monitor the logs of the container in realtime `docker logs -f apache`.

* container version number 

`docker inspect -f '{{ index .Config.Labels "build_version" }}' apache`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/apache`


**Versions**

+ **14.10.16:** Add version layer information.
+ **09.09.16:** Add layer badges to README.
+ **06.11.15:** Initial Release
