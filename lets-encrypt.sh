#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")

source .env

docker run -it --rm --name="certbot" --network="web-gateway_default" \
  -v "$data_dir/certbot/domains.list":/domains.list:ro \
  -v "$service_dir/conf/certbot/update-certs.sh":/update-certs.sh:ro \
  phpdockerio/kong-certbot-agent \
  /update-certs.sh
