#!/bin/sh

set -e

confd --backend rancher --prefix /2016-07-29 &

# Wait for confd to create initial config files
while [ ! -f /etc/nginx/nginx.conf ]; do
  sleep 1
done

exec "$@"
