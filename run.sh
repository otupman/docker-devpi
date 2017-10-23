#!/bin/bash
set -e
set -x
export DEVPI_SERVERDIR=/mnt
export DEVPI_CLIENTDIR=/tmp/devpi-client
[[ -f $DEVPI_SERVERDIR/.serverversion ]] || initialize=yes

  cd /mnt
if [[ $initialize = yes ]]; then
  # devpi use http://localhost:3141
  # devpi login root --password=''
  # devpi user -m root password="${DEVPI_PASSWORD}"
  # devpi index -y -c public pypi_whitelist='*'

  devpi-server  --init
  touch .serverversion
fi


devpi-server --host 0.0.0.0
