FROM stackbrew/ubuntu:14.04
MAINTAINER Arcus "http://arcus.io"
RUN echo "deb http://ppa.launchpad.net/rethinkdb/ppa/ubuntu trusty main" > /etc/apt/sources.list.d/rethinkdb.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 11D62AD6
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y rethinkdb
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
WORKDIR /data
VOLUME /data
CMD ["--bind", "all"]
ENTRYPOINT ["/usr/bin/rethinkdb"]
