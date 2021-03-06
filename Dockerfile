# Pull base image.
FROM ubuntu
MAINTAINER veeru "cheftestn@gmail.com"

# Install Node.js
RUN \
  apt-get update && \
  apt-get install -y  wget  && \
  cd /tmp && \
  apt-get install -y nodejs npm git git-core
# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  mkdir -p /data/db

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Define default command.
CMD ["mongod"]

# Expose ports.
# - 27017: process
# - 28017: http
EXPOSE 8080
EXPOSE 27017
EXPOSE 28017
