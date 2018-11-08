#!/usr/bin/env bash

cd $(dirname "${BASH_SOURCE[0]}")

echo "7 1 */30 * * $PWD/lets-encrypt.sh >> /dev/null 2>&1" | crontab
