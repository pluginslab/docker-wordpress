FROM nginx:alpine

ADD docker/nginx/default.conf /etc/nginx/conf.d

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN addgroup -g ${GID} --system wordpress
RUN adduser -G wordpress --system -D -s /bin/sh -u ${UID} wordpress
RUN sed -i "s/user  nginx/user  wordpress/g" /etc/nginx/nginx.conf
