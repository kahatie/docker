FROM node:7-alpine
MAINTAINER kahatie <kahatie@gmail.com>
ENV TERM=xterm \
    IONIC_VERSION=2.1.14 \
    CORDOVA_VERSION=6.4.0

#RUN npm install -g npm@"$NPM_VERSION" && \
#    npm install -g grunt-cli@"$GRUNT_VERSION" bower@"$BOWER_VERSION"  cordova@"$CORDOVA_VERSION" ionic@"$IONIC_VERSION" gulp@"$GULP_VERSION" && \
#    npm cache clear && \
#    ionic start myApp sidemenu && \

RUN npm install -g cordova@"$CORDOVA_VERSION" ionic@"$IONIC_VERSION"  && \
    ionic start myApp sidemenu

WORKDIR myApp

# Expose port: web (8100), livereload (35729) EXPOSE 8100 35729
EXPOSE 8100 35729
CMD ["ionic", "serve", "8100", "35729"]
