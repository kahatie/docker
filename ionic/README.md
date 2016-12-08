# docker-ionic
[![Docker Hub](https://img.shields.io/badge/docker-kahatie%2Fionic-008bb8.svg)](https://registry.hub.docker.com/u/kahatie/ionic/)
[![](https://images.microbadger.com/badges/image/kahatie/docker-ionic.svg)](https://microbadger.com/images/kahatie/docker-ionic "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/kahatie/docker-ionic.svg)](https://microbadger.com/images/kahatie/docker-ionic "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/kahatie/docker-ionic.svg)](https://microbadger.com/images/kahatie/docker-ionic "Get your own commit badge on microbadger.com")

[Dockerfile](https://github.com/kahatie/docker-ionic/blob/master/Dockerfile)

ionic framework

### Usage
```
docker run -ti \
-v /path/to/your/ionic-project/:/myApp:rw \
-p 8100:8100 -p 35729:35729 \
kahatie/ionic
```
