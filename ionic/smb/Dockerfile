FROM kahatie/ionic
MAINTAINER kahatie <kahatie@gmail.com>

RUN apt-get update -qq && \
	apt-get install -qqy --no-install-recommends \
   samba && \
   useradd -c 'Samba User' -d /tmp -M -r smbuser && \
   sed -i 's|^\(   log file = \).*|\1/dev/stdout|' /etc/samba/smb.conf && \
   sed -i 's|^\(   unix password sync = \).*|\1no|' /etc/samba/smb.conf && \
   sed -i '/Share Definitions/,$d' /etc/samba/smb.conf && \
   echo '   security = user' >>/etc/samba/smb.conf && \
   echo '   create mask = 0664' >>/etc/samba/smb.conf && \
   echo '   force create mode = 0664' >>/etc/samba/smb.conf && \
   echo '   directory mask = 0775' >>/etc/samba/smb.conf && \
   echo '   force directory mode = 0775' >>/etc/samba/smb.conf && \
   echo '   force user = smbuser' >>/etc/samba/smb.conf && \
   echo '   force group = users' >>/etc/samba/smb.conf && \
   echo '   load printers = no' >>/etc/samba/smb.conf && \
   echo '   printing = bsd' >>/etc/samba/smb.conf && \
   echo '   printcap name = /dev/null' >>/etc/samba/smb.conf && \
   echo '   disable spoolss = yes' >>/etc/samba/smb.conf && \
   echo '   socket options = TCP_NODELAY' >>/etc/samba/smb.conf && \
   echo '' >>/etc/samba/smb.conf && \
   echo '[ionic]' >>/etc/samba/smb.conf && \
   echo '   path = $PROJET' >>/etc/samba/smb.conf && \
   echo '   browsable  = yes' >>/etc/samba/smb.conf && \
   echo '   read only = no' >>/etc/samba/smb.conf && \
   echo '   guest ok = no' >>/etc/samba/smb.conf && \
	apt-get clean && \ 
	apt-get autoclean && \
   rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 137/udp 138/udp 139 445
