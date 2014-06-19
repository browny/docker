FROM phusion/baseimage:0.9.10

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

# === Update ===
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties

# === SSH server ===
RUN apt-get install -y openssh-server
RUN echo 'root:root' |chpasswd


# === Install MongoDB ===
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  mkdir -p /usr/local/mongodb-data

RUN chmod 777 /usr/local/mongodb-data

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

# === Startup ===
ADD ./init.sh /opt/init.sh
RUN chmod 777 /opt/init.sh

EXPOSE 22

ENTRYPOINT ["/opt/init.sh"]
