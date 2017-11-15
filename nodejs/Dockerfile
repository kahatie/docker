
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
          
ENV TERM=xterm \
	WORKDIR=/nodejs \
  
VOLUME ${WORKDIR}

# init script 
COPY init.sh /init.sh

RUN apt-get update && \
	apt-get install -y\
	curl && \
	curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get install -y nodejs && \
	npm update -g && \
	
	npm cache clear && \
	apt-get clean && \ 
	apt-get autoclean && \
	chmod a+x /init.sh && \
	cordova telemetry off

# Expose port: web (8100), livereload (35729)
EXPOSE ${IONIC_SERVE_PORT} ${IONIC_LIVERELOAD_PORT}

CMD ["/init.sh"]
