FROM dockerfile/ubuntu

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

# === Update ===
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y upgrade

# === Java7 ===
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

# Automatically accept oracle license
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get -y install oracle-java7-installer && apt-get clean
RUN update-alternatives --display java
RUN echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment

# === Tomcat6 ===
RUN apt-get install -y tomcat6 tomcat6-admin
RUN sed -i "s#</tomcat-users>##g" /etc/tomcat6/tomcat-users.xml; \
    echo '<role rolename="manager"/>' >> /etc/tomcat6/tomcat-users.xml; \
    echo '<role rolename="admin"/>' >> /etc/tomcat6/tomcat-users.xml; \
    echo '<user username="admin" password="admin" roles="admin,manager"/>' >> /etc/tomcat6/tomcat-users.xml; \
    echo '</tomcat-users>' >> /etc/tomcat6/tomcat-users.xml

ENV JAVA_HEAP_SIZE 512
ENV JAVE_PERM_SIZE 512

RUN sed -i "s|#JAVA_HOME=.*|JAVA_HOME=$JAVA_HOME|g" /etc/default/tomcat6
RUN sed -i "s|-Xmx128m|-Xmx${JAVA_HEAP_SIZE}m -XX:PermSize=256m -XX:MaxPermSize=${JAVE_PERM_SIZE}m|g" /etc/default/tomcat6

RUN sudo ln -s /var/lib/tomcat6/* /usr/share/tomcat6/

# === Solr ===
ADD file/solr-4.8.0.tgz /root/
RUN mkdir /opt/solr
RUN cp -R /root/solr-4.8.0/example/solr/* /opt/solr
RUN cp /root/solr-4.8.0/dist/solr-4.8.0.war /opt/solr/solr.war
RUN cp /root/solr-4.8.0/dist/solrj-lib/* /usr/share/tomcat6/lib/
RUN cp /root/solr-4.8.0/example/resources/log4j.properties /usr/share/tomcat6/conf/

RUN cat "JAVA_OPTIONS=\"-Dsolr.solr.home=/opt/solr $JAVA_OPTIONS\"" >> /etc/default/tomcat6

RUN echo "<Context docBase=\"/opt/solr/solr.war\" debug=\"0\" crossContext=\"true\"> <Environment name=\"solr/home\" type=\"java.lang.String\" value=\"/opt/solr\" override=\"true\" /> </Context>" > /usr/share/tomcat6/conf/Catalina/localhost/solr.xml

# === Deploy the war ===
#ADD war/WAR_FILE /var/lib/tomcat6/webapps/

EXPOSE 22
EXPOSE 8080

# CMD sudo service tomcat6 start && sudo tail -f /var/lib/tomcat6/logs/catalina.out
