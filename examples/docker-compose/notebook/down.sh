#!/bin/bash
# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Setup environment
<<<<<<< HEAD
source "$DIR/env.sh"

# Bring down the notebook container, using container name as project name
docker-compose -f "$DIR/notebook.yml" -p "$NAME" down
=======
# shellcheck disable=SC1091
source "${DIR}/env.sh"

# Bring down the notebook container, using container name as project name
docker-compose -f "${DIR}/notebook.yml" -p "${NAME}" down
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
