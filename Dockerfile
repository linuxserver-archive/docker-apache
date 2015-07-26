FROM phusion/baseimage:0.9.16
MAINTAINER smdion <me@seandion.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive 
ENV HOME /root 
ENV TERM screen 
ENV APACHE_RUN_USER abc 
ENV APACHE_RUN_GROUP abc 
ENV APACHE_LOG_DIR /var/log/apache2 
ENV APACHE_LOCK_DIR /var/lock/apache2 
ENV APACHE_PID_FILE /var/run/apache2.pid 
ENV APACHE_RUN_DIR /var/run/apache2

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Dependencies
RUN \
  apt-get update -q && \
  apt-get install -qy apache2 php5 libapache2-mod-php5 wget inotify-tools libapache2-mod-proxy-html && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Enable proxy
RUN a2enmod proxy proxy_http proxy_ajp rewrite deflate substitute headers proxy_balancer proxy_connect proxy_html ssl xml2enc 
RUN service apache2 restart

#Volumes and Ports
EXPOSE 80 443
VOLUME ["/etc/apache2/sites-available/", "/var/www"]

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/000-default.conf /defaults/000-default.conf
ADD defaults/apache2.conf /etc/apache2/apache2.conf
ADD defaults/ports.conf /etc/apache2/ports.conf
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
 
#Adduser
RUN useradd -u 911 -U -s /bin/false abc
RUN usermod -G users abc
