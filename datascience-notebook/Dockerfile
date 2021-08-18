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

<<<<<<< HEAD
# Set when building on Travis so that certain long-running build steps can
# be skipped to shorten build time.
ARG TEST_ONLY_BUILD

=======
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
# Fix DL4006
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# Julia installation
# Default values can be overridden at build time
# (ARGS are in lower case to distinguish them from ENV)
# Check https://julialang.org/downloads/
<<<<<<< HEAD
ARG julia_version="1.6.0"
# SHA256 checksum
ARG julia_checksum="463b71dc70ca7094c0e0fd6d55d130051a7901e8dec5eb44d6002c57d1bd8585"

# R pre-requisites
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
=======
ARG julia_version="1.6.1"
# SHA256 checksum
ARG julia_checksum="7c888adec3ea42afbfed2ce756ce1164a570d50fa7506c3f2e1e2cbc49d52506"

# R pre-requisites
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    fonts-dejavu \
    gfortran \
    gcc && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Julia dependencies
<<<<<<< HEAD
# install Julia packages in /opt/julia instead of $HOME
=======
# install Julia packages in /opt/julia instead of ${HOME}
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
ENV JULIA_DEPOT_PATH=/opt/julia \
    JULIA_PKGDIR=/opt/julia \
    JULIA_VERSION="${julia_version}"

WORKDIR /tmp

# hadolint ignore=SC2046
RUN mkdir "/opt/julia-${JULIA_VERSION}" && \
    wget -q https://julialang-s3.julialang.org/bin/linux/x64/$(echo "${JULIA_VERSION}" | cut -d. -f 1,2)"/julia-${JULIA_VERSION}-linux-x86_64.tar.gz" && \
    echo "${julia_checksum} *julia-${JULIA_VERSION}-linux-x86_64.tar.gz" | sha256sum -c - && \
    tar xzf "julia-${JULIA_VERSION}-linux-x86_64.tar.gz" -C "/opt/julia-${JULIA_VERSION}" --strip-components=1 && \
<<<<<<< HEAD
    rm "/tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz"
RUN ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# Show Julia where conda libraries are \
RUN mkdir /etc/julia && \
    echo "push!(Libdl.DL_LOAD_PATH, \"$CONDA_DIR/lib\")" >> /etc/julia/juliarc.jl && \
=======
    rm "/tmp/julia-${JULIA_VERSION}-linux-x86_64.tar.gz" && \
    ln -fs /opt/julia-*/bin/julia /usr/local/bin/julia

# Show Julia where conda libraries are \
RUN mkdir /etc/julia && \
    echo "push!(Libdl.DL_LOAD_PATH, \"${CONDA_DIR}/lib\")" >> /etc/julia/juliarc.jl && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    # Create JULIA_PKGDIR \
    mkdir "${JULIA_PKGDIR}" && \
    chown "${NB_USER}" "${JULIA_PKGDIR}" && \
    fix-permissions "${JULIA_PKGDIR}"

<<<<<<< HEAD
USER $NB_UID

# R packages including IRKernel which gets installed globally.
RUN conda install --quiet --yes \
    'r-base=4.0.3'  \
    'r-caret=6.0*' \
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
    'r-rsqlite=2.2*' \
    'r-shiny=1.6*' \
    'r-tidyverse=1.3*' \
    'rpy2=3.4*' && \
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
    'rpy2' \
    'unixodbc' && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

<<<<<<< HEAD
# Add Julia packages. Only add HDF5 if this is not a test-only build since
# it takes roughly half the entire build time of all of the images on Travis
# to add this one package and often causes Travis to timeout.
#
=======
# Add Julia packages.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
# Install IJulia as jovyan and then move the kernelspec out
# to the system share location. Avoids problems with runtime UID change not
# taking effect properly on the .local folder in the jovyan home dir.
RUN julia -e 'import Pkg; Pkg.update()' && \
<<<<<<< HEAD
    (test $TEST_ONLY_BUILD || julia -e 'import Pkg; Pkg.add("HDF5")') && \
    julia -e "using Pkg; pkg\"add IJulia\"; pkg\"precompile\"" && \
=======
    julia -e 'import Pkg; Pkg.add("HDF5")' && \
    julia -e 'using Pkg; pkg"add IJulia"; pkg"precompile"' && \
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    # move kernelspec out of home \
    mv "${HOME}/.local/share/jupyter/kernels/julia"* "${CONDA_DIR}/share/jupyter/kernels/" && \
    chmod -R go+rx "${CONDA_DIR}/share/jupyter" && \
    rm -rf "${HOME}/.local" && \
    fix-permissions "${JULIA_PKGDIR}" "${CONDA_DIR}/share/jupyter"

<<<<<<< HEAD
WORKDIR $HOME
=======
WORKDIR "${HOME}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
