FROM ubuntu:20.04
#the following ARG turns off the questions normally asked for location and timezone for Apache
ENV DEBIAN_FRONTEND=noninteractive

#install all the tools you might want to use in your container
#probably should change to apt-get install -y --no-install-recommends
RUN apt update
RUN apt install -y software-properties-common

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt install -y vim
#RUN apt install libapache2-mod-fcgid
#RUN apt install vim -y
RUN apt-get update
# Install PHP-fpm &onfigure Apache to use our PHP-FPM socket for all PHP files
RUN apt install php7.3-fpm php7.3-common php7.3-mysql php7.3-xml php7.3-xmlrpc php7.3-curl \
    php7.3-gd php-imagick php7.3-cli php7.3-dev php7.3-imap php7.3-mbstring php7.3-soap \
    php7.3-zip php7.3-bcmath php7.3-xml php7.3-intl php7.3-json php7.3-mcrypt php7.3-gmp php-redis -y
RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

COPY php7.3/virgil_crypto_php.so /usr/lib/php/20180731/
COPY php7.3/vscp_pythia_php7.3_v0.15.2.so /usr/lib/php/20180731/
COPY php7.3/vsce_phe_php7.3_v0.15.2.so /usr/lib/php/20180731/
COPY php7.3/vscf_foundation_php7.3_v0.15.2.so /usr/lib/php/20180731/
COPY php7.3/virgil_crypto.ini /etc/php/7.3/fpm/conf.d/
COPY php7.3/virgil_crypto.ini /etc/php/7.3/cli/conf.d/
#COPY php.ini /etc/php/7.3/fpm/
#COPY 000-default.conf /etc/apache2/sites-available
RUN pecl install --configureoptions 'enable-redis-igbinary="no" enable-redis-lzf="no" enable-redis-zstd="no"' redis
RUN echo "extension=redis.so" > /etc/php/7.3/mods-available/redis.ini
RUN ln -sf /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/fpm/conf.d/20-redis.ini
RUN ln -sf /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/cli/conf.d/20-redis.ini
RUN ln -sf /etc/php/7.3/mods-available/redis.ini /etc/php/7.3/cli/conf.d/20-redis.ini

#RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh && chmod 777 nodesource_setup.sh
#RUN ./nodesource_setup.sh
#RUN apt-get install nodejs -y

#EXPOSE 80

#set working directory to where Apache serves files
WORKDIR /var/www/html/gedeco

CMD php bin/console messenger:consume async
