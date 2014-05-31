FROM phusion/baseimage:0.9.10

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

# === redis ===
RUN apt-get -y install redis-server

EXPOSE 6379

CMD /usr/bin/redis-server
