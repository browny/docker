FROM dockerfile/ubuntu

# === Set locale ===
RUN locale-gen --no-purge zh_TW.UTF-8
ENV LANG zh_TW.UTF-8
ENV LANGUAGE zh_TW.UTF-8
ENV LC_ALL zh_TW.UTF-8
