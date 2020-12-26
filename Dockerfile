FROM php:7.4-alpine

LABEL maintainer="Christin Gruber <c.gruber@touchdesign.de>"
LABEL description="PHIVE docker image"

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

WORKDIR ~

RUN curl -OLSs https://phar.io/releases/phive.phar \
    && curl -OLSs https://phar.io/releases/phive.phar.asc

RUN apk -U add gnupg \
	&& gpg --keyserver hkps.pool.sks-keyservers.net --recv-keys 0x9D8A98B29B2D5D79 \
	&& gpg --verify phive.phar.asc phive.phar \
	&& rm phive.phar.asc \
	&& chmod +x phive.phar \
	&& mv phive.phar /usr/local/bin/phive
ENTRYPOINT ["phive"]