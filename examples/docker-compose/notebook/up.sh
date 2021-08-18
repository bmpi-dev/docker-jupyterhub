#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

<<<<<<< HEAD
USAGE="Usage: `basename $0` [--secure | --letsencrypt] [--password PASSWORD] [--secrets SECRETS_VOLUME]"
=======
USAGE="Usage: $(basename "${0}") [--secure | --letsencrypt] [--password PASSWORD] [--secrets SECRETS_VOLUME]"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

# Parse args to determine security settings
SECURE=${SECURE:=no}
LETSENCRYPT=${LETSENCRYPT:=no}
<<<<<<< HEAD
while [[ $# > 0 ]]; do
key="$1"
case $key in
=======
while [[ $# -gt 0 ]]; do
key="${1}"
case "${key}" in
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    --secure)
    SECURE=yes
    ;;
    --letsencrypt)
    LETSENCRYPT=yes
    ;;
    --secrets)
<<<<<<< HEAD
    SECRETS_VOLUME="$2"
    shift # past argument
    ;;
    --password)
    PASSWORD="$2"
=======
    SECRETS_VOLUME="${2}"
    shift # past argument
    ;;
    --password)
    PASSWORD="${2}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    export PASSWORD
    shift # past argument
    ;;
    *) # unknown option
    ;;
esac
shift # past argument or value
done

<<<<<<< HEAD
if [[ "$LETSENCRYPT" == yes || "$SECURE" == yes ]]; then
    if [ -z "${PASSWORD:+x}" ]; then
        echo "ERROR: Must set PASSWORD if running in secure mode"
        echo "$USAGE"
        exit 1
    fi
    if [ "$LETSENCRYPT" == yes ]; then
        CONFIG=letsencrypt-notebook.yml
        if [ -z "${SECRETS_VOLUME:+x}" ]; then
            echo "ERROR: Must set SECRETS_VOLUME if running in letsencrypt mode"
            echo "$USAGE"
=======
if [[ "${LETSENCRYPT}" == yes || "${SECURE}" == yes ]]; then
    if [ -z "${PASSWORD:+x}" ]; then
        echo "ERROR: Must set PASSWORD if running in secure mode"
        echo "${USAGE}"
        exit 1
    fi
    if [ "${LETSENCRYPT}" == yes ]; then
        CONFIG=letsencrypt-notebook.yml
        if [ -z "${SECRETS_VOLUME:+x}" ]; then
            echo "ERROR: Must set SECRETS_VOLUME if running in letsencrypt mode"
            echo "${USAGE}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
            exit 1
        fi
    else
        CONFIG=secure-notebook.yml
    fi
    export PORT=${PORT:=443}
else
    CONFIG=notebook.yml
    export PORT=${PORT:=80}
fi

# Setup environment
<<<<<<< HEAD
source "$DIR/env.sh"

# Create a Docker volume to store notebooks
docker volume create --name "$WORK_VOLUME"

# Bring up a notebook container, using container name as project name
echo "Bringing up notebook '$NAME'"
docker-compose -f "$DIR/$CONFIG" -p "$NAME" up -d

IP=$(docker-machine ip $(docker-machine active))
echo "Notebook $NAME listening on $IP:$PORT"
=======
# shellcheck disable=SC1091
source "${DIR}/env.sh"

# Create a Docker volume to store notebooks
docker volume create --name "${WORK_VOLUME}"

# Bring up a notebook container, using container name as project name
echo "Bringing up notebook '${NAME}'"
docker-compose -f "${DIR}/${CONFIG}" -p "${NAME}" up -d

IP=$(docker-machine ip "$(docker-machine active)")
echo "Notebook ${NAME} listening on ${IP}:${PORT}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
