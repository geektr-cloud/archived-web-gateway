#!/usr/bin/env bash
KONG_ADMIN_URL=http://kong:8001
CERT_EMAIL=geektheripper@gmail.com

domains_list_conf=/domains.list

pushd /workdir

ADD_ARGS=

if [ "$CERTBOT_TEST" = "true" ]; then
  ADD_ARGS=-t
fi

while read line || [ -n "$line" ]; do
  ./certbot-agent certs:update $ADD_ARGS $KONG_ADMIN_URL $CERT_EMAIL $line
done < "$domains_list_conf"

popd
