#!/bin/bash
set -e

SSL_DIR="/etc/nginx/ssl"
CERT="$SSL_DIR/$DOMAIN_NAME.crt"
KEY="$SSL_DIR/$DOMAIN_NAME.key"

if [ ! -f "$CERT" ]; then
    echo "Generating self-signed TLS certificate..."
    openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout "$KEY" \
        -out "$CERT" \
        -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=$DOMAIN_NAME"
fi

exec nginx -g "daemon off;"

