FROM phusion/baseimage:0.9.16
MAINTAINER smdion <me@seandion.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV TERM screen

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

# Manually set the apache environment variables in order to get apache to work immediately.
RUN echo abc > /etc/container_environment/APACHE_RUN_USER
RUN echo abc > /etc/container_environment/APACHE_RUN_GROUP
RUN echo /var/log/apache2 > /etc/container_environment/APACHE_LOG_DIR
RUN echo /var/lock/apache2 > /etc/container_environment/APACHE_LOCK_DIR
RUN echo /var/run/apache2.pid > /etc/container_environment/APACHE_PID_FILE
RUN echo /var/run/apache2 > /etc/container_environment/APACHE_RUN_DIR
  
#Volumes and Ports
EXPOSE 80 443
VOLUME ["/etc/apache2/sites-available/", "/var/www"]

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/ /defaults/
ADD defaults/apache2.conf /etc/apache2/apache2.conf
ADD defaults/ports.conf /etc/apache2/ports.conf
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
 
#Adduser
RUN useradd -u 911 -U -s /bin/false abc
RUN usermod -G users abc
