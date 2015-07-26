#/bin/bash

RUN echo abc > /etc/container_environment/APACHE_RUN_USER
RUN echo abc > /etc/container_environment/APACHE_RUN_GROUP
RUN echo /var/log/apache2 > /etc/container_environment/APACHE_LOG_DIR
RUN echo /var/lock/apache2 > /etc/container_environment/APACHE_LOCK_DIR
RUN echo /var/run/apache2.pid > /etc/container_environment/APACHE_PID_FILE
RUN echo /var/run/apache2 > /etc/container_environment/APACHE_RUN_DIR
