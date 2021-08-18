# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
<<<<<<< HEAD
ARG BASE_CONTAINER=jupyter/minimal-notebook
=======
ARG OWNER=jupyter
ARG BASE_CONTAINER=$OWNER/minimal-notebook
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
FROM $BASE_CONTAINER

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

# R pre-requisites
<<<<<<< HEAD
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
=======
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    fonts-dejavu \
    unixodbc \
    unixodbc-dev \
    r-cran-rodbc \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Fix for devtools https://github.com/conda-forge/r-devtools-feedstock/issues/4
RUN ln -s /bin/tar /bin/gtar

<<<<<<< HEAD
USER $NB_UID

# R packages
RUN conda install --quiet --yes \
    'r-base=4.0.3' \
    'r-caret=6.*' \
    'r-crayon=1.4*' \
    'r-devtools=2.4*' \
    'r-forecast=8.14*' \
    'r-hexbin=1.28*' \
    'r-htmltools=0.5*' \
    'r-htmlwidgets=1.5*' \
    'r-irkernel=1.1*' \
    'r-nycflights13=1.0*' \
    'r-randomforest=4.6*' \
    'r-rcurl=1.98*' \
    'r-rmarkdown=2.7*' \
    'r-rodbc=1.3*' \
    'r-rsqlite=2.2*' \
    'r-shiny=1.6*' \
    'r-tidyverse=1.3*' \
    'unixodbc=2.3.*' \
    'r-tidymodels=0.1*' \
    && \
=======
USER ${NB_UID}

# R packages including IRKernel which gets installed globally.
RUN conda install --quiet --yes \
    'r-base' \
    'r-caret' \
    'r-crayon' \
    'r-devtools' \
    'r-forecast' \
    'r-hexbin' \
    'r-htmltools' \
    'r-htmlwidgets' \
    'r-irkernel' \
    'r-nycflights13' \
    'r-randomforest' \
    'r-rcurl' \
    'r-rmarkdown' \
    'r-rodbc' \
    'r-rsqlite' \
    'r-shiny' \
    'r-tidymodels' \
    'r-tidyverse' \
    'unixodbc' && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Install e1071 R package (dependency of the caret R package)
<<<<<<< HEAD
RUN conda install --quiet --yes r-e1071
=======
RUN conda install --quiet --yes 'r-e1071' && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
