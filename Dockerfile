FROM kahatie/debian:jessie
MAINTAINER kahatie <kahatie@gmail.com>

# Mise a jour / installation des packet
RUN apt-get update && apt-get install -y\
apache2/
libapache2-mod-php5/
php5/
mysql-server/
phpmyadmin/
&& apt-get clean/
&& rm -rf /var/lib/apt/lists/*


# supprimer le fichier index par defaut d'appache
RUN rm /var/www/index.html
ADD index.php /var/www/index.php

# Config de Apache
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Map port 80 et ssl apache2
EXPOSE 80 443

# Volume mysql
VOLUME ["/var/lib/mysql"]
# Volume apache2
VOLUME ["/var/www"]

# Copie le fichier de config de supervisord mie a jour avec les nouveaux programes
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start supervisor
CMD ["/usr/bin/supervisord"]
