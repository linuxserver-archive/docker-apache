FROM linuxserver/baseimage
MAINTAINER smdion <me@seandion.com>
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Install Dependencies
RUN \
  apt-get update -q && \
  apt-get install -qy apache2 php5 libapache2-mod-php5 wget inotify-tools libapache2-mod-proxy-html && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*

# Update apache configuration with this one
RUN \
  rm /etc/apache2/sites-available/* && \
  ln -s /config/proxy-config.conf /etc/apache2/sites-available/000-default.conf && \
  ln -s /var/log/apache2 /logs
  rm -R -f /var/www && \
  ln -s /web /var/www

# Enable proxy
RUN a2enmod proxy proxy_http proxy_ajp rewrite deflate substitute headers proxy_balancer proxy_connect proxy_html ssl xml2enc 
RUN service apache2 restart

#Volumes and Ports
EXPOSE 80 443
VOLUME ["/config", "/web", "/logs"]

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
ADD defaults/000-default.conf /defaults/000-default.conf
ADD defaults/apache2.conf /etc/apache2/apache2.conf
ADD defaults/ports.conf /etc/apache2/ports.conf
ADD defaults/envvars /etc/apache2/envvars
RUN chmod -v +x /etc/service/*/run
RUN chmod -v +x /etc/my_init.d/*.sh
 
#Adduser
RUN useradd -u 911 -U -s /bin/false abc
RUN usermod -G users abc
