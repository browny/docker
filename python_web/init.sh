#!/bin/bash

/usr/bin/ssh-keygen -A
/usr/sbin/sshd -D &

python /opt/python_web/hello.py
