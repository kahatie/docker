 mkdir -p /home/mysql
 mv /var/lib/mysql /home/mysql
 ln -s /home/mysql /var/lib/mysql
 chown -h mysql:mysql /home/mysql
