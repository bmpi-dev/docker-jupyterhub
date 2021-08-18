# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

# https://hub.docker.com/r/jupyter/base-notebook/tags
<<<<<<< HEAD
ARG BASE_CONTAINER=jupyter/base-notebook:aec555e49be6
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"
ENV TAG="aec555e49be6"

=======
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/base-notebook:33add21fab64
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"
ENV TAG="33add21fab64"

WORKDIR "${HOME}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
COPY binder/README.ipynb .

# Fix permissions on README.ipynb as root
USER root

RUN fix-permissions README.ipynb

# Switch back to jovyan to avoid accidental container runs as root
<<<<<<< HEAD
USER $NB_UID

WORKDIR $HOME
=======
USER ${NB_UID}

WORKDIR "${HOME}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
