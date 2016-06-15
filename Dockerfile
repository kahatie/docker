FROM kahatie/debian:wheezy
MAINTAINER kahatie <kahatie@gmail.com>

VOLUME ["/var/lib/mediatomb"]

# Mise a jour / installation des packet
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y\
 mediatomb-daemon\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

# ADD config.xml /etc/mediatomb/config.xml
# ADD config.xml /var/lib/mediatomb/config.xml

# Map port 
EXPOSE 49152/tcp 1900/udp 
ENTRYPOINT /usr/bin/mediatomb -c /var/lib/mediatomb/config.xml -a /Media
