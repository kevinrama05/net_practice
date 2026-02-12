#!/bin/bash
set -e

MARKER="/var/lib/mysql/.db_initialized"

if [ ! -f "$MARKER" ]; then
    echo "Running MariaDB first-time initialization..."

    mariadbd --user=mysql --skip-networking &
    pid="$!"

    # wait until mariadb is ready
    for i in {1..30}; do
        if mariadb -u root -e "SELECT 1;" >/dev/null 2>&1; then
            break
        fi
        sleep 1
    done

    mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
EOF

    kill "$pid"
    wait "$pid" || true

    touch "$MARKER"
fi

exec mariadbd --user=mysql

