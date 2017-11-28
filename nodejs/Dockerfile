
FROM kahatie/debian:8
MAINTAINER kahatie <kahatie@gmail.com>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="nodejs" \
      org.label-schema.description="nodejs Docker" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kahatie/docker" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
          
ENV 	TERM=xterm \
	HOME=/home/nodejs \
	UID=1000
  
VOLUME /home/nodejs

RUN useradd -r -u $UID -g users kahatie

RUN apt-get update && \
	apt-get install -y\
	curl debconf-utils && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs software-properties-common && \
	add-apt-repository "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" && \
	apt-get update && \
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections && \
	echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 seen true" | debconf-set-selections && \
	apt-get install -y oracle-java8-installer && \
	npm update -g && \
	npm install --global cordova vue-cli && \
	npm cache clear --force && \
	apt-get clean && \ 
	apt-get autoclean && \
	cordova telemetry off

USER kahatie

WORKDIR $HOME

# Expose port: webpack dev server
EXPOSE 8080
