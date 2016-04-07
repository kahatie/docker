
#deplace workspace mysql dans /home 
mkdir -p /home/mysql
mv /var/lib/mysql /home/mysql
ln -s /home/mysql /var/lib/mysql
chown -h mysql:mysql /home/mysql
#réinitialise la base de donnée mysql
mysql_install_db –-user=mysql –ldata=/var/lib/mysql

#config mod apache
a2enmod dav_svn
a2dissite 000-default.conf
a2ensite default.conf

# creation du depot
mkdir /home/svn/
svnadmin create /home/svn/repository/
svn checkout --username system file:///home/svn/repository/
