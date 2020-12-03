#!/bin/bash
set -e

# default behaviour is to launch squid 
if [[ -z ${1} ]]; then
  if [[ ! -d ${SQUID_CACHE_DIR}/00 ]]; then
    echo "Initializing cache..."
    squid -N -f /etc/squid/squid.conf -z
  fi
  echo "Starting squid..."
  exec squid -f /etc/squid/squid.conf -NYCd 1 ${EXTRA_ARGS}
else
  exec "$@"
fi
