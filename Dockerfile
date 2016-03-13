FROM debian:jessie
MAINTAINER kahatie <kahatie@gmail.com>

# Ne pas poser de questions debconf lors des phases d'installation
ENV DEBIAN_FRONTEND noninteractive

# Mise a jour / installation des packet
RUN apt-get update && apt-get install -y\
 supervisor\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

# Copie le fichier de config de supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
