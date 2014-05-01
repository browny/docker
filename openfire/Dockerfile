FROM centos:6.4

RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum -y install httpd vim-enhanced bash-completion unzip

# === Openfire install ===
RUN yum install -y libldb.i686
ADD openfire-3.9.1-1.i386.rpm /tmp/
RUN rpm -ivh /tmp/openfire-3.9.1-1.i386.rpm

EXPOSE 9090
EXPOSE 9091
EXPOSE 5222
EXPOSE 5223

CMD service openfire start && tail -f /opt/openfire/logs/error.log
