FROM kahatie/debian:jessie
MAINTAINER kahatie <kahatie@gmail.com>

# Mise a jour / installation des packet
RUN apt-get update && apt-get install -y\
 apache2\
 libapache2-mod-php5\
 php5\
 mysql-server\
 phpmyadmin\
 openssh-server\
 && apt-get clean\
 && rm -rf /var/lib/apt/lists/*

# Copie le fichier de config de supervisord mie a jour avec les nouveaux programes
COPY supervisord.conf /etc/supervisor/conf.d/debian-lamp.conf

# Map port 80 et ssl apache2
EXPOSE 22 80 443

# Config de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Volume mysql
VOLUME ["/var/lib/mysql"]
# Volume apache2
VOLUME ["/var/www"]

# ajout le fichier index.php
ADD index.php /var/www/index.php

# Start supervisor
CMD ["/usr/bin/supervisord"]
