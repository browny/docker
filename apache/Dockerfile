FROM phusion/baseimage:0.9.10

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

# === Update ===
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common python-software-properties

# === SSH server ===
RUN apt-get install -y openssh-server
RUN echo 'root:root' |chpasswd

# === Apache server ===
RUN apt-get install -y apache2 libapache2-mod-proxy-html libxml2-dev

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# === Startup ===
ADD ./init.sh /opt/init.sh
RUN chmod 777 /opt/init.sh

EXPOSE 22
EXPOSE 80

ENTRYPOINT ["/opt/init.sh"]
