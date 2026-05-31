#this is the base OCI image for docker image creation
FROM sloopstash/amazon-linux-2:v1.1.1

#To Install dependency packages before installing redis packages
RUN yum install tcl

#Download Redis from official website
RUN wget http://download.redis.io/releases/redis-7.2.1.tar.gz -P /tmp
