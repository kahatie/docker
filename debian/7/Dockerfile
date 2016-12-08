FROM debian:wheezy
MAINTAINER kahatie <kahatie@gmail.com>

# Ne pas poser de questions debconf lors des phases d'installation
ENV DEBIAN_FRONTEND noninteractive
# definie le type de terminal (util pour debug et utiliser des editor vi nano ...)
ENV TERM xterm

# Mise a jour / installation des packet
RUN apt-get update && apt-get install -y\
 supervisor\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

# Start supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]