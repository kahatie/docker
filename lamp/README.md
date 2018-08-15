# lamp

[![Docker Hub](https://img.shields.io/badge/docker-kahatie%2Flamp-008bb8.svg)](https://registry.hub.docker.com/u/kahatie/lamp/)
[![](https://images.microbadger.com/badges/image/kahatie/lamp.svg)](https://microbadger.com/images/kahatie/lamp "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/kahatie/lamp.svg)](https://microbadger.com/images/kahatie/lamp "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/kahatie/lamp.svg)](https://microbadger.com/images/kahatie/lamp "Get your own commit badge on microbadger.com")

[Dockerfile](https://github.com/kahatie/docker/blob/master/lamp/Dockerfile)


**Pull image**

```
docker pull kahatie/lamp
```

**Run container**

```
docker run -d  --name=<container name> -v <path for files>:/home -v /etc/localtime:/etc/localtime:ro -p 8080:80 -p 8443:443 kahatie/lamp
```

Please replace all user variables in the above command defined by <> with the correct values.


get bash 
```
docker exec -i -t <container name> bash
```
set mysql password
```
mysqladmin -u root password '<mon mot de passe>'
```
add svn user 
```
htpasswd -cs /home/svn/dav_svn.passwd user1
```
logs 
```
docker logs <container name>
```

phpmyadmin
```
http://<ip:port>/phpmyadmin
```