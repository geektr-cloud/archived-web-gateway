#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")

source .env

docker run -it --rm \
  --name="certbot" \
  --network="web-gateway_default" \
  phpdockerio/kong-certbot-agent \
  ./certbot-agent certs:update http://kong:8001 geektheripper@gmail.com $1
