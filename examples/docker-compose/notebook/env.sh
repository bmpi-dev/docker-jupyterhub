#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Set default values for environment variables required by notebook compose
# configuration file.

# Container name
: "${NAME:=my-notebook}"
export NAME

# Exposed container port
<<<<<<< HEAD
: ${PORT:=80}
export PORT

# Container work volume name
: "${WORK_VOLUME:=$NAME-work}"
export WORK_VOLUME

# Container secrets volume name
: "${SECRETS_VOLUME:=$NAME-secrets}"
=======
: "${PORT:=80}"
export PORT

# Container work volume name
: "${WORK_VOLUME:=${NAME}-work}"
export WORK_VOLUME

# Container secrets volume name
: "${SECRETS_VOLUME:=${NAME}-secrets}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
export SECRETS_VOLUME
