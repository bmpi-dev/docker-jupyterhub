# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
<<<<<<< HEAD
ARG BASE_CONTAINER=jupyter/base-notebook
=======
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/base-notebook
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# Install all OS dependencies for fully functional notebook server
<<<<<<< HEAD
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
=======
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    vim-tiny \
    git \
    inkscape \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
<<<<<<< HEAD
=======
    openssh-client \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    # ---- nbconvert dependencies ----
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    # ----
    tzdata \
    unzip \
<<<<<<< HEAD
    nano-tiny \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
=======
    nano-tiny && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

# Create alternative for nano -> nano-tiny
RUN update-alternatives --install /usr/bin/nano nano /bin/nano-tiny 10

# Switch back to jovyan to avoid accidental container runs as root
<<<<<<< HEAD
USER $NB_UID
=======
USER ${NB_UID}
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
