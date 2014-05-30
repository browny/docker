FROM phusion/baseimage:0.9.10

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

# === Update ===
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential software-properties-common python-software-properties python-setuptools

# === SSH server ===
RUN apt-get install -y openssh-server
RUN echo 'root:root' |chpasswd

# === thumbor ===
RUN apt-get install -y python-dev python-imaging
RUN easy_install pip
RUN pip install thumbor

EXPOSE 22
EXPOSE 8888

ADD ./init.sh /opt/init.sh
RUN chmod 777 /opt/init.sh

ENTRYPOINT ["/opt/init.sh"]
