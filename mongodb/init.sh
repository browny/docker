#!/bin/bash

/usr/bin/ssh-keygen -A
/usr/sbin/sshd -D &

mongod --dbpath /usr/local/mongodb-data/
