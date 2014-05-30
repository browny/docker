#!/bin/bash

service apache2 start
/usr/bin/ssh-keygen -A
/usr/sbin/sshd -D
