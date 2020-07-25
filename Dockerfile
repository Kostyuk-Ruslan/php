FROM php:7.4-fpm
MAINTAINER  Kostyuk_Ruslan
ENV v_php=7.4.8
RUN apt-get update && apt-get install -y  \
		autoconf \
		pkg-config \
		gcc \
		libffi-dev \
		libgcrypt-dev \
		libmcrypt-dev \
		libpng-dev \
		libxslt-dev \
		libzip-dev \
		make \
		wget \
		libsqlite3-dev \
    && cd /tmp \
    && wget  https://www.php.net/distributions/php-${v_php}.tar.gz \
    && tar -xvf php-${v_php}.tar.gz \
    && cd /tmp/php-${v_php} \
    && ./configure \
#       ./buildconf \ 
&&       make  \
&&       make install
WORKDIR /var/www
EXPOSE 9000

CMD ["php-fpm" "-F"]
