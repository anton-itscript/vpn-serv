FROM ubuntu:14.04

MAINTAINER Anton Chukhlomin <anton@itscript.com>

RUN echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    echo "deb http://repo.pritunl.com/stable/apt trusty main" > /etc/apt/sources.list.d/pritunl.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7F0CEB10 && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv CF8E292A && \
    apt-get --assume-yes update && \
    apt-get --assume-yes upgrade && \
    apt-get --assume-yes install pritunl mongodb-org

ADD ./start.sh /start.sh

EXPOSE 1194/udp 1195/udp 9700

CMD /start.sh
