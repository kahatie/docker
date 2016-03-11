FROM kahatie/debian
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



RUN rm /var/www/index.html
ADD index.php /var/www/index.php


# Config de Apache

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 80

CMD ["/bin/bash"]
