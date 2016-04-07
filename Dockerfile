FROM kahatie/debian:jessie
MAINTAINER kahatie <kahatie@gmail.com>

# Config de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /home/log/apache2

# Volume home
VOLUME ["/home/"]

# Mise a jour / installation des packet
RUN apt-get update && apt-get install -y\
 apache2\
 libapache2-mod-php5\
 php5\
 mysql-server\
 phpmyadmin\
 openssh-server\
 subversion\ 
 libapache2-svn\ 
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

# Copie le fichier de config de supervisord
COPY supervisord.conf /etc/supervisor/conf.d/debian-lamp.conf
# Copie les fichiers de config de svn
COPY dav_svn.conf /etc/apache2/mods-available/dav_svn.conf
# apache 2 config
COPY default.conf /etc/apache2/sites-available/default.conf
#repository config
COPY hooks/ /tmp/hooks

# init script 
COPY init.sh /init.sh
RUN chmod +x /init.sh; sync; ./init.sh; rm /init.sh

# Map port 80 et ssl apache2
EXPOSE 22 80 443
