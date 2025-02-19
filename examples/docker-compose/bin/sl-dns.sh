#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

# User must have slcli installed
which slcli > /dev/null || (echo "SoftLayer cli not found (pip install softlayer)"; exit 1)

<<<<<<< HEAD
USAGE="Usage: `basename $0` machine_name [domain]"
E_BADARGS=85

# Machine name is first command line arg
MACHINE_NAME=$1 && [ -z "$MACHINE_NAME" ] && echo "$USAGE" && exit $E_BADARGS

# Use SOFTLAYER_DOMAIN env var if domain name not set as second arg
DOMAIN="${2:-$SOFTLAYER_DOMAIN}" && [ -z "$DOMAIN" ] && \
    echo "Must specify domain or set SOFTLAYER_DOMAIN environment varable" && \
    echo "$USAGE" && exit $E_BADARGS

IP=$(docker-machine ip "$MACHINE_NAME")

slcli dns record-add $DOMAIN $MACHINE_NAME A $IP
=======
USAGE="Usage: $(basename "${0}") machine_name [domain]"
E_BADARGS=85

# Machine name is first command line arg
MACHINE_NAME="${1}" && [ -z "${MACHINE_NAME}" ] && echo "${USAGE}" && exit ${E_BADARGS}

# Use SOFTLAYER_DOMAIN env var if domain name not set as second arg
DOMAIN="${2:-$SOFTLAYER_DOMAIN}" && [ -z "${DOMAIN}" ] && \
    echo "Must specify domain or set SOFTLAYER_DOMAIN environment varable" && \
    echo "${USAGE}" && exit ${E_BADARGS}

IP=$(docker-machine ip "${MACHINE_NAME}")

slcli dns record-add "${DOMAIN}" "${MACHINE_NAME}" A "${IP}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
