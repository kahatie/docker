FROM alpine:3.5
MAINTAINER kahatie <kahatie@gmail.com>

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="samba" \
      org.label-schema.description="samba" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/kahatie/docker" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"
			
RUN apk add --update --no-cache samba-server samba-common-tools
		
COPY smb.conf /etc/samba/smb.conf
      
EXPOSE 137/udp 138/udp 139 445

CMD ["sh"]