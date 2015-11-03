FROM linuxserver/baseimage.apache
MAINTAINER smdion <me@seandion.com>

ENV APTLIST="libapache2-mod-php5 wget inotify-tools php5-gd php5-sqlite php5-mcrypt php5-tidy php5-mysql libapache2-mod-proxy-html"

# Install Dependencies
RUN \
  apt-get update -q && \
  apt-get install -qy $APTLIST && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Enable apache mods for proxy
RUN a2enmod proxy proxy_http proxy_ajp rewrite deflate substitute headers proxy_balancer proxy_connect proxy_html ssl xml2enc 

#Volumes and Ports
EXPOSE 80 443
VOLUME ["/config"]

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/000-default.conf /defaults/000-default.conf
ADD defaults/apache2.conf /etc/apache2/apache2.conf
ADD defaults/ports.conf /etc/apache2/ports.conf
ADD defaults/envvars /etc/apache2/envvars
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
 
