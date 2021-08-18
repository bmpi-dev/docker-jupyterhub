#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup environment
<<<<<<< HEAD
source "$DIR/env.sh"

# Build the notebook image
docker-compose -f "$DIR/notebook.yml" build
=======
# shellcheck disable=SC1091
source "${DIR}/env.sh"

# Build the notebook image
docker-compose -f "${DIR}/notebook.yml" build
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
