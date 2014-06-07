#!/bin/bash

a2enmod proxy
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod rewrite
a2enmod deflate
a2enmod headers
a2enmod proxy_balancer
a2enmod proxy_connect
a2enmod proxy_html

sudo apt-get install apache2-prefork-dev
mkdir ~/modbuild/ && cd ~/modbuild/
wget http://apache.webthing.com/svn/apache/filters/mod_xml2enc.c
wget http://apache.webthing.com/svn/apache/filters/mod_xml2enc.h
apxs2 -aic -I/usr/include/libxml2 ./mod_xml2enc.c
cd ~
rm -rfd ~/modbuild/

service apache2 start
/usr/bin/ssh-keygen -A
/usr/sbin/sshd -D
