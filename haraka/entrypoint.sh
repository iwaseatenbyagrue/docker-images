#!/bin/sh

CONFIG_DIR="${HARAKA_CONFIG_DIR:-"/var/lib/haraka/config/"}"
TLS_CN="${HARAKA_FQDN:-"$(hostname -f)"}"


echo "${TLS_CN}" > ${CONFIG_DIR}/me

if [ -z "$HARAKA_SKIP_TLS_GEN" ]; then

  if [ ! -e "${CONFIG_DIR}/tls_key.pem" ]; then
    openssl req -x509 -newkey rsa:2048 \
      -nodes -keyout "${CONFIG_DIR}/tls_key.pem" \
      -out "${CONFIG_DIR}/tls_cert.pem" -days 365 \
      -subj "/CN=${TLS_CN}"
  fi
fi

echo "${HARAKA_LOG_LEVEL:-LOGINFO}" > ${CONFIG_DIR}/loglevel


exec /usr/bin/haraka "$@"
