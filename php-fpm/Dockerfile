FROM alpine:3.11

ADD https://packages.whatwedo.ch/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN echo "https://packages.whatwedo.ch/php-alpine/v3.11/php-7.3" >> /etc/apk/repositories && \
    apk --update add ca-certificates
ENV LD_LIBRARY_PATH=/usr/lib/php7/modules/
RUN apk add --update libzip-dev libc6-compat libmcrypt-dev libpng-dev libjpeg-turbo-dev libxml2-dev icu-dev postgresql-dev curl-dev libmemcached-dev &&\
    apk add --update --virtual build-dependencies build-base gcc wget autoconf && \
    apk del build-dependencies &&\
    rm -rf /var/cache/apk/*
# install php and some extensions
RUN apk add --update \
    coreutils \
    php \
    php-gmp \
    php-bz2 \
    php-json \
    php7-fpm \
    php7-apcu \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-iconv \
    php7-json \
    php7-intl \
    php7-mcrypt \
    php7-phar \
    php7-gd \
    #php7-fileinfo\
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-xml \
    php7-session \
    php7-zip \
    #php7-tokenizer \
    php7-redis \
    #php7-simplexml \
    curl

COPY symfony.ini /etc/php7/conf.d/
COPY symfony.ini /etc/php7/cli/conf.d/
#COPY xdebug.ini  /etc/php7/conf.d/


COPY php7.3/virgil_crypto.ini  /etc/php7/conf.d/
COPY php7.3/virgil_crypto.ini  /etc/php7/cli/conf.d/
COPY php7.3/virgil_crypto_php.so /usr/lib/php7/modules/
COPY php7.3/vsce_phe_php7.3_v0.15.2.so /usr/lib/php7/modules/
COPY php7.3/vscf_foundation_php7.3_v0.15.2.so /usr/lib/php7/modules/
COPY php7.3/vscp_pythia_php7.3_v0.15.2.so /usr/lib/php7/modules/

RUN cp /lib64/ld-linux-x86-64.so.2 /lib/ && ln -sf /usr/bin/php7 /usr/bin/php

COPY symfony.pool.conf /etc/php7/php-fpm.d/
#COPY www.conf /etc/php7/php-fpm.d/
#COPY php-fpm.conf /etc/php7/
ADD start.sh /
RUN chmod 777 /start.sh

CMD ["sh","/start.sh"]

WORKDIR /var/www/html/gedmindef
EXPOSE 9000
