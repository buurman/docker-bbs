FROM lsiobase/alpine.nginx:3.5
MAINTAINER buurman

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="version:- ${VERSION} Build-date:- ${BUILD_DATE}"

# install runtime packages
RUN \
 apk add --no-cache \
	php7-dom \
	php7-gd \
	php7-intl \
	php7-mbstring \
	php7-opcache \
	php7-openssl \
	php7-pdo_sqlite \
	php7-zlib \
  git

# install BBS
RUN mkdir /var/www/bbs
RUN git clone https://github.com/rvolz/BicBucStriim.git /var/www/bbs

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config /books
