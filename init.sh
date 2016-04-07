
#config mod apache
a2enmod dav_svn
a2dissite 000-default.conf
a2ensite default.conf

# creation du depot
mkdir /home/svn/
svnadmin create /home/svn/repository/
svn checkout --username system file:///home/svn/repository/
