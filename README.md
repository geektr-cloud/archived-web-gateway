# Example

this project deployed via [geektr-cloud/deployer](https://github.com/geektr-cloud/deployer)

## Web Gateway

```bash
# update (init) project to local enviroment
# when first run, it will init data directory and secrets directory
deployer update geektr-cloud/web-gateway

# edit secrets files
# vim xxxxxx

# up the services
deployer up geektr-cloud/web-gateway

# update ssl certs
./lets-encrypt.sh

# set crontab to auto update ssl certs
./set-crontab.sh

# proxy a entry server to kong
GATEWAY_BACKEND=$(dig +short backend.gateway.geektr.cloud)

iptables -A FORWARD -j ACCEPT
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --dport 80  -j DNAT --to-destination $GATEWAY_BACKEND:8000
iptables -t nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination $GATEWAY_BACKEND:8443

# get ssh certs manually
./fast-cert.sh xxxx.geektr.cloud
```
