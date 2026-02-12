#!/bin/bash
set -e

if [ ! -f "wp-config.php" ]; then
    echo "Downloading WordPress..."
    curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz
    tar -xzf wordpress.tar.gz --strip-components=1
    rm wordpress.tar.gz

    echo "Waiting for MariaDB..."
    until mariadb -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASSWORD" -e "SELECT 1;" >/dev/null 2>&1; do
        sleep 2
    done

    echo "Configuring WordPress..."
    cp wp-config-sample.php wp-config.php

    sed -i "s/database_name_here/$DB_NAME/" wp-config.php
    sed -i "s/username_here/$DB_USER/" wp-config.php
    sed -i "s/password_here/$DB_PASSWORD/" wp-config.php
    sed -i "s/localhost/$DB_HOST/" wp-config.php
fi

exec php-fpm8.2 -F

