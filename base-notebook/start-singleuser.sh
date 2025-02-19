#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

set -e

# set default ip to 0.0.0.0
<<<<<<< HEAD
if [[ "$NOTEBOOK_ARGS $@" != *"--ip="* ]]; then
    NOTEBOOK_ARGS="--ip=0.0.0.0 $NOTEBOOK_ARGS"
=======
if [[ "${NOTEBOOK_ARGS} $*" != *"--ip="* ]]; then
    NOTEBOOK_ARGS="--ip=0.0.0.0 ${NOTEBOOK_ARGS}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
fi

# handle some deprecated environment variables
# from DockerSpawner < 0.8.
# These won't be passed from DockerSpawner 0.9,
# so avoid specifying --arg=empty-string
<<<<<<< HEAD
if [ ! -z "$NOTEBOOK_DIR" ]; then
    NOTEBOOK_ARGS="--notebook-dir='$NOTEBOOK_DIR' $NOTEBOOK_ARGS"
fi
if [ ! -z "$JPY_PORT" ]; then
    NOTEBOOK_ARGS="--port=$JPY_PORT $NOTEBOOK_ARGS"
fi
if [ ! -z "$JPY_USER" ]; then
    NOTEBOOK_ARGS="--user=$JPY_USER $NOTEBOOK_ARGS"
fi
if [ ! -z "$JPY_COOKIE_NAME" ]; then
    NOTEBOOK_ARGS="--cookie-name=$JPY_COOKIE_NAME $NOTEBOOK_ARGS"
fi
if [ ! -z "$JPY_BASE_URL" ]; then
    NOTEBOOK_ARGS="--base-url=$JPY_BASE_URL $NOTEBOOK_ARGS"
fi
if [ ! -z "$JPY_HUB_PREFIX" ]; then
    NOTEBOOK_ARGS="--hub-prefix=$JPY_HUB_PREFIX $NOTEBOOK_ARGS"
fi
if [ ! -z "$JPY_HUB_API_URL" ]; then
    NOTEBOOK_ARGS="--hub-api-url=$JPY_HUB_API_URL $NOTEBOOK_ARGS"
fi
NOTEBOOK_BIN="jupyterhub-singleuser"

. /usr/local/bin/start.sh $NOTEBOOK_BIN $NOTEBOOK_ARGS "$@"
=======
if [ -n "${NOTEBOOK_DIR}" ]; then
    # shellcheck disable=SC2089
    NOTEBOOK_ARGS="--notebook-dir='${NOTEBOOK_DIR}' ${NOTEBOOK_ARGS}"
fi
if [ -n "${JPY_PORT}" ]; then
    NOTEBOOK_ARGS="--port=${JPY_PORT} ${NOTEBOOK_ARGS}"
fi
if [ -n "${JPY_USER}" ]; then
    NOTEBOOK_ARGS="--user=${JPY_USER} ${NOTEBOOK_ARGS}"
fi
if [ -n "${JPY_COOKIE_NAME}" ]; then
    NOTEBOOK_ARGS="--cookie-name=${JPY_COOKIE_NAME} ${NOTEBOOK_ARGS}"
fi
if [ -n "${JPY_BASE_URL}" ]; then
    NOTEBOOK_ARGS="--base-url=${JPY_BASE_URL} ${NOTEBOOK_ARGS}"
fi
if [ -n "${JPY_HUB_PREFIX}" ]; then
    NOTEBOOK_ARGS="--hub-prefix=${JPY_HUB_PREFIX} ${NOTEBOOK_ARGS}"
fi
if [ -n "${JPY_HUB_API_URL}" ]; then
    NOTEBOOK_ARGS="--hub-api-url=${JPY_HUB_API_URL} ${NOTEBOOK_ARGS}"
fi
NOTEBOOK_BIN="jupyterhub-singleuser"

# shellcheck disable=SC1091,SC2086,SC2090
. /usr/local/bin/start.sh "${NOTEBOOK_BIN}" ${NOTEBOOK_ARGS} "$@"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
