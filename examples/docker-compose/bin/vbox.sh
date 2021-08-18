#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# Set reasonable default VM settings
<<<<<<< HEAD
: ${VIRTUALBOX_CPUS:=4}
export VIRTUALBOX_CPUS
: ${VIRTUALBOX_MEMORY_SIZE:=4096}
=======
: "${VIRTUALBOX_CPUS:=4}"
export VIRTUALBOX_CPUS
: "${VIRTUALBOX_MEMORY_SIZE:=4096}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
export VIRTUALBOX_MEMORY_SIZE

docker-machine create --driver virtualbox "$@"
