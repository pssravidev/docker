# Source Docker image used for this build process.
FROM sloopstash/amazon-linux-2:v1.1.1

# Install system dependencies for the redis database workload
RUN yum install -y tcl

#Download redis from source and extract the package
WORKDIR /tmp
RUN set -x \
  && wget http://download.redis.io/releases/redis-7.2.1.tar.gz --quiet \
  && tar xvzf redis-7.2.1.tar.gz > /dev/null

#Install redis 
RUN set -x \
&& cd redis-7.2.1 \
&& make \
&& make install

#Remove temp files and create directories to customize redis
RUN set -x \
&& rm -rf /tmp/redis-* \
&& mkdir /opt/redis \
&& mkdir /opt/redis/data \
&& mkdir /opt/redis/log \
&& mkdir /opt/redis/conf \
&& mkdir /opt/redis/script \
&& mkdir /opt/redis/system \
&& touch /opt/redis/system/server.pid \
&& touch /opt/redis/system/supervisor.ini \
&& history -c

