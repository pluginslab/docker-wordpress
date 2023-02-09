FROM php:8.1.0-fpm-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN addgroup -g ${GID} --system wordpress
RUN adduser -G wordpress --system -D -s /bin/sh -u ${UID} wordpress
RUN sed -i "s/user = www-data/user = wordpress/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = wordpress/g" /usr/local/etc/php-fpm.d/www.conf