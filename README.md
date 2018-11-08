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
```
