#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Use https://letsencrypt.org to create a certificate for a single domain
# and store it in a Docker volume.

set -e

# Get domain and email from environment
<<<<<<< HEAD
[ -z "$FQDN" ] && \
    echo "ERROR: Must set FQDN environment varable" && \
    exit 1

[ -z "$EMAIL" ] && \
=======
[ -z "${FQDN}" ] && \
    echo "ERROR: Must set FQDN environment varable" && \
    exit 1

[ -z "${EMAIL}" ] && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    echo "ERROR: Must set EMAIL environment varable" && \
    exit 1

# letsencrypt certificate server type (default is production).
# Set `CERT_SERVER=--staging` for staging.
<<<<<<< HEAD
: ${CERT_SERVER=''}

# Create Docker volume to contain the cert
: ${SECRETS_VOLUME:=my-notebook-secrets}
docker volume create --name $SECRETS_VOLUME 1>/dev/null
# Generate the cert and save it to the Docker volume
docker run --rm -it \
    -p 80:80 \
    -v $SECRETS_VOLUME:/etc/letsencrypt \
=======
: "${CERT_SERVER=''}"

# Create Docker volume to contain the cert
: "${SECRETS_VOLUME:=my-notebook-secrets}"
docker volume create --name "${SECRETS_VOLUME}" 1>/dev/null
# Generate the cert and save it to the Docker volume
docker run --rm -it \
    -p 80:80 \
    -v "${SECRETS_VOLUME}":/etc/letsencrypt \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    quay.io/letsencrypt/letsencrypt:latest \
    certonly \
    --non-interactive \
    --keep-until-expiring \
    --standalone \
    --standalone-supported-challenges http-01 \
    --agree-tos \
<<<<<<< HEAD
    --domain "$FQDN" \
    --email "$EMAIL" \
    $CERT_SERVER
=======
    --domain "${FQDN}" \
    --email "${EMAIL}" \
    "${CERT_SERVER}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

# Set permissions so nobody can read the cert and key.
# Also symlink the certs into the root of the /etc/letsencrypt
# directory so that the FQDN doesn't have to be known later.
docker run --rm -it \
<<<<<<< HEAD
    -v $SECRETS_VOLUME:/etc/letsencrypt \
    ubuntu:20.04 \
    bash -c "ln -s /etc/letsencrypt/live/$FQDN/* /etc/letsencrypt/ && \
=======
    -v "${SECRETS_VOLUME}":/etc/letsencrypt \
    ubuntu:20.04 \
    bash -c "ln -s /etc/letsencrypt/live/${FQDN}/* /etc/letsencrypt/ && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
        find /etc/letsencrypt -type d -exec chmod 755 {} +"
