FROM kalilinux/kali-linux-docker

LABEL maintainer="warhorse@thedarkcloud.net"

RUN apt-get install -y gnupg 
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get update && \
apt-get install --no-install-recommends -y \
ca-certificates \
expect \
openjdk-11-jdk \
curl && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* &&\
update-java-alternatives -s java-1.11.0-openjdk-amd64 

WORKDIR /opt
RUN mkdir /opt/cobaltstrike
COPY ./docker-entrypoint.sh /opt/
RUN chmod +x /opt/docker-entrypoint.sh

WORKDIR /opt/cobaltstrike 

EXPOSE 50050
ENTRYPOINT ["/opt/docker-entrypoint.sh"]
