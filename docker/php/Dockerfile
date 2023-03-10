FROM php:8.1.0-fpm-alpine

ARG UID
ARG GID

ARG NEWRELIC_KEY
ARG NEWRELIC_APP_NAME
ARG NEWRELIC_DAEMON_ADDRESS

ENV UID=${UID}
ENV GID=${GID}

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql
RUN addgroup -g ${GID} --system wordpress
RUN adduser -G wordpress --system -D -s /bin/sh -u ${UID} wordpress
RUN sed -i "s/user = www-data/user = wordpress/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = wordpress/g" /usr/local/etc/php-fpm.d/www.conf

RUN if [ "$NEWRELIC_ENABLED" = "true" ]; then \
    curl -o newrelic.tar.gz https://download.newrelic.com/php_agent/release/newrelic-php5-10.6.0.318-linux-musl.tar.gz \
    && gzip -dc newrelic.tar.gz | tar xf - \
    && cd newrelic-php5-10.6.0.318-linux-musl \
    && NR_INSTALL_USE_CP_NOT_LN=1 NR_INSTALL_SILENT=1 ./newrelic-install install \
    && rm -rf ../newrelic-php5-10.6.0.318-linux-musl newrelic.tar.gz \
    && sed -i \
    -e 's/"REPLACE_WITH_REAL_KEY"/'"$NEWRELIC_KEY"'/' \
    -e 's/newrelic.appname = "PHP Application"/newrelic.appname = '"$NEWRELIC_APP_NAME"'/' \
    -e 's/;newrelic.daemon.app_connect_timeout =.*/newrelic.daemon.app_connect_timeout=15s/' \
    -e 's/;newrelic.daemon.start_timeout =.*/newrelic.daemon.start_timeout=5s/' \
    -e 's/;newrelic.daemon.address =.*/newrelic.daemon.address='"$NEWRELIC_DAEMON_ADDRESS"'/' \
    -e 's/;newrelic.daemon.dont_launch =.*/newrelic.daemon.dont_launch = 3/' \
    /usr/local/etc/php/conf.d/newrelic.ini \
  fi
