FROM debian:jessie
MAINTAINER kahatie <kahatie@gmail.com>

# Ne pas poser de questions debconf lors des phases d'installation
ENV DEBIAN_FRONTEND noninteractive

# Mise a jour / installation des packet
# RUN apt-get update && apt-get install -y\
# && apt-get clean
# && rm -rf /var/lib/apt/lists/*
