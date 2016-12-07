FROM node:7-alpine
MAINTAINER kahatie <kahatie@gmail.com>
ENV TERM=xterm \
    IONIC_VERSION=2.0.0 \
    BOWER_VERSION=1.7.7 \
    CORDOVA_VERSION=6.0.0 \
    GRUNT_VERSION=0.1.13 \
    GULP_VERSION=3.9.1

RUN npm install -g npm@"$NPM_VERSION" && \
    npm install -g grunt-cli@"$GRUNT_VERSION" bower@"$BOWER_VERSION"  cordova@"$CORDOVA_VERSION" ionic@"$IONIC_VERSION" gulp@"$GULP_VERSION" && \
    npm cache clear && \
    ionic start myApp sidemenu && \

WORKDIR myApp
EXPOSE 8100
CMD ["ionic", "serve"]
