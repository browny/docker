FROM dockerfile/ubuntu

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8

# === Jenkins ===
RUN apt-get install -q -y openjdk-7-jre-headless && apt-get clean
ADD http://mirrors.jenkins-ci.org/war/1.560/jenkins.war /opt/jenkins.war
RUN ln -sf /jenkins /root/.jenkins

ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080
VOLUME ["/jenkins"]
CMD [""]
