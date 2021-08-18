# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
<<<<<<< HEAD
ARG BASE_CONTAINER=jupyter/scipy-notebook
=======
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/scipy-notebook
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

# Install Tensorflow
<<<<<<< HEAD
RUN pip install --quiet --no-cache-dir \
    'tensorflow==2.4.1' && \
=======
RUN mamba install --quiet --yes \
    'tensorflow' && \
    mamba clean --all -f -y && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
