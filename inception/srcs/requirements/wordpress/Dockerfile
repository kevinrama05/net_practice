FROM debian:bookworm

RUN apt update && apt install -y \
    php-fpm php-mysql php-cli curl mariadb-client \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/php
COPY tools/wp-entrypoint.sh /usr/local/bin/wp-entrypoint.sh
RUN chmod +x /usr/local/bin/wp-entrypoint.sh
RUN sed -i 's|listen = .*|listen = 9000|' /etc/php/*/fpm/pool.d/www.conf
WORKDIR /var/www/html
EXPOSE 9000
ENTRYPOINT ["wp-entrypoint.sh"]

