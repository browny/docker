#!/bin/bash

/usr/sbin/sshd &&
sudo service tomcat6 start &&
sudo tail -f /var/lib/tomcat6/logs/catalina.out
