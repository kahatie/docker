#!/bin/bash

# deplace workspace mysql dans /home 
if [ ! -d "/home/mysql" ]; then
  mkdir -p /home/mysql
  mv /var/lib/mysql /home/mysql
  ln -s /home/mysql /var/lib/mysql
  chown -h mysql:mysql /home/mysql
fi

# initialise la base de donnée mysql
if [ ! -d "/var/lib/mysql/mysql" ]; then
  mysql_install_db –-user=mysql –ldata=/var/lib/mysql
fi

# config mod apache
a2enmod dav_svn
a2dissite 000-default.conf
a2ensite default.conf
if [ ! -d "/home/www" ]; then
  mkdir -p /home/www
fi
chown -h www-data:www-data /home/www


# creation du depot si il n'existe pas 
if !([ -f /home/svn/repository ]) then
  mkdir -p /home/svn
  svnadmin create /home/svn/repository
  mv /tmp/hooks /home/svn/repository/hooks
  svn checkout --username system file:///home/svn/repository/
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
