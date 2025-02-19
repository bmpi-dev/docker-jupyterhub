# Common Features

<<<<<<< HEAD
A container launched from any Jupyter Docker Stacks image runs a Jupyter Notebook server by default. The container does so by executing a `start-notebook.sh` script. This script configures the internal container environment and then runs `jupyter notebook`, passing it any command line arguments received.
=======
A container launched from any Jupyter Docker Stacks image runs a Jupyter Notebook server by default.
The container does so by executing a `start-notebook.sh` script.
This script configures the internal container environment and then runs `jupyter notebook`, passing it any command line arguments received.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

This page describes the options supported by the startup script as well as how to bypass it to run alternative commands.

## Notebook Options

<<<<<<< HEAD
You can pass [Jupyter command line options](https://jupyter.readthedocs.io/en/latest/projects/jupyter-command.html) to the `start-notebook.sh` script when launching the container. For example, to secure the Notebook server with a custom password hashed using `IPython.lib.passwd()` instead of the default token, you can run the following:
=======
You can pass [Jupyter command line options](https://jupyter-notebook.readthedocs.io/en/stable/config.html#options) to the `start-notebook.sh` script when launching the container.
For example, to secure the Notebook server with a custom password hashed using `IPython.lib.passwd()` instead of the default token, you can run the following:
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

```bash
docker run -d -p 8888:8888 jupyter/base-notebook start-notebook.sh --NotebookApp.password='sha1:74ba40f8a388:c913541b7ee99d15d5ed31d4226bf7838f83a50e'
```

For example, to set the base URL of the notebook server, you can run the following:

```bash
docker run -d -p 8888:8888 jupyter/base-notebook start-notebook.sh --NotebookApp.base_url=/some/path
```

## Docker Options

You may instruct the `start-notebook.sh` script to customize the container environment before launching
<<<<<<< HEAD
the notebook server. You do so by passing arguments to the `docker run` command.

* `-e NB_USER=jovyan` - Instructs the startup script to change the default container username from `jovyan` to the provided value. Causes the script to rename the `jovyan` user home folder. For this option to take effect, you must run the container with `--user root`, set the working directory `-w /home/$NB_USER` and set the environment variable `-e CHOWN_HOME=yes` (see below for detail). This feature is useful when mounting host volumes with specific home folder.
* `-e NB_UID=1000` - Instructs the startup script to switch the numeric user ID of `$NB_USER` to the given value. This feature is useful when mounting host volumes with specific owner permissions. For this option to take effect, you must run the container with `--user root`. (The startup script will `su $NB_USER` after adjusting the user ID.) You might consider using modern Docker options `--user` and `--group-add` instead. See the last bullet below for details.
* `-e NB_GID=100` - Instructs the startup script to change the primary group of`$NB_USER` to `$NB_GID` (the new group is added with a name of `$NB_GROUP` if it is defined, otherwise the group is named `$NB_USER`).  This feature is useful when mounting host volumes with specific group permissions. For this option to take effect, you must run the container with `--user root`. (The startup script will `su $NB_USER` after adjusting the group ID.) You might consider using modern Docker options `--user` and `--group-add` instead. See the last bullet below for details.  The user is added to supplemental group `users` (gid 100) in order to allow write access to the home directory and `/opt/conda`.  If you override the user/group logic, ensure the user stays in group `users` if you want them to be able to modify files in the image.
* `-e NB_GROUP=<name>` - The name used for `$NB_GID`, which defaults to `$NB_USER`.  This is only used if `$NB_GID` is specified and completely optional: there is only cosmetic effect.
* `-e NB_UMASK=<umask>` - Configures Jupyter to use a different umask value from default, i.e. `022`. For example, if setting umask to `002`, new files will be readable and writable by group members instead of just writable by the owner. Wikipedia has a good article about [umask](https://en.wikipedia.org/wiki/Umask). Feel free to read it in order to choose the value that better fits your needs. Default value should fit most situations. Note that `NB_UMASK` when set only applies to the Jupyter process itself - you cannot use it to set a umask for additional files created during run-hooks e.g. via `pip` or `conda` - if you need to set a umask for these you must set `umask` for each command.
* `-e CHOWN_HOME=yes` - Instructs the startup script to change the `$NB_USER` home directory owner and group to the current value of `$NB_UID` and `$NB_GID`. This change will take effect even if the user home directory is mounted from the host using `-v` as described below. The change is **not** applied recursively by default. You can change modify the `chown` behavior by setting `CHOWN_HOME_OPTS` (e.g., `-e CHOWN_HOME_OPTS='-R'`).
* `-e CHOWN_EXTRA="<some dir>,<some other dir>"` - Instructs the startup script to change the owner and group of each comma-separated container directory to the current value of `$NB_UID` and `$NB_GID`. The change is **not** applied recursively by default. You can change modify the `chown` behavior by setting `CHOWN_EXTRA_OPTS` (e.g., `-e CHOWN_EXTRA_OPTS='-R'`).
* `-e GRANT_SUDO=yes` - Instructs the startup script to grant the `NB_USER` user passwordless `sudo` capability. You do **not** need this option to allow the user to `conda` or `pip` install additional packages. This option is useful, however, when you wish to give `$NB_USER` the ability to install OS packages with `apt` or modify other root-owned files in the container. For this option to take effect, you must run the container with `--user root`. (The `start-notebook.sh` script will `su $NB_USER` after adding `$NB_USER` to sudoers.) **You should only enable `sudo` if you trust the user or if the container is running on an isolated host.**
* `-e GEN_CERT=yes` - Instructs the startup script to generates a self-signed SSL certificate and configure Jupyter Notebook to use it to accept encrypted HTTPS connections.
* `-e JUPYTER_ENABLE_LAB=yes` - Instructs the startup script to run `jupyter lab` instead of the default `jupyter notebook` command. Useful in container orchestration environments where setting environment variables is easier than change command line parameters.
* `-e RESTARTABLE=yes` - Runs Jupyter in a loop so that quitting Jupyter does not cause the container to exit.  This may be useful when you need to install extensions that require restarting Jupyter.
* `-v /some/host/folder/for/work:/home/jovyan/work` - Mounts a host machine directory as folder in the container. Useful when you want to preserve notebooks and other work even after the container is destroyed. **You must grant the within-container notebook user or group (`NB_UID` or `NB_GID`) write access to the host directory (e.g., `sudo chown 1000 /some/host/folder/for/work`).**
* `--user 5000 --group-add users` - Launches the container with a specific user ID and adds that user to the `users` group so that it can modify files in the default home directory and `/opt/conda`. You can use these arguments as alternatives to setting `$NB_UID` and `$NB_GID`.
=======
the notebook server.
You do so by passing arguments to the `docker run` command.

- `-e NB_USER=jovyan` - Instructs the startup script to change the default container username from `jovyan` to the provided value.
  Causes the script to rename the `jovyan` user home folder.
  For this option to take effect, you must run the container with `--user root`, set the working directory `-w /home/${NB_USER}` and set the environment variable `-e CHOWN_HOME=yes` (see below for detail).
  This feature is useful when mounting host volumes with specific home folder.
- `-e NB_UID=1000` - Instructs the startup script to switch the numeric user ID of `${NB_USER}` to the given value.
  This feature is useful when mounting host volumes with specific owner permissions.
  For this option to take effect, you must run the container with `--user root`.
  (The startup script will `su ${NB_USER}` after adjusting the user ID.)
  You might consider using modern Docker options `--user` and `--group-add` instead.
  See the last bullet below for details.
- `-e NB_GID=100` - Instructs the startup script to change the primary group of`${NB_USER}` to `${NB_GID}`
  (the new group is added with a name of `${NB_GROUP}` if it is defined, otherwise the group is named `${NB_USER}`).
  This feature is useful when mounting host volumes with specific group permissions.
  For this option to take effect, you must run the container with `--user root`.
  (The startup script will `su ${NB_USER}` after adjusting the group ID.)
  You might consider using modern Docker options `--user` and `--group-add` instead.
  See the last bullet below for details.
  The user is added to supplemental group `users` (gid 100) in order to allow write access to the home directory and `/opt/conda`.
  If you override the user/group logic, ensure the user stays in group `users` if you want them to be able to modify files in the image.
- `-e NB_GROUP=<name>` - The name used for `${NB_GID}`, which defaults to `${NB_USER}`.
  This is only used if `${NB_GID}` is specified and completely optional: there is only cosmetic effect.
- `-e NB_UMASK=<umask>` - Configures Jupyter to use a different umask value from default, i.e. `022`.
  For example, if setting umask to `002`, new files will be readable and writable by group members instead of just writable by the owner.
  Wikipedia has a good article about [umask](https://en.wikipedia.org/wiki/Umask).
  Feel free to read it in order to choose the value that better fits your needs.
  Default value should fit most situations.
  Note that `NB_UMASK` when set only applies to the Jupyter process itself - you cannot use it to set a umask for additional files created during run-hooks
  e.g. via `pip` or `conda` - if you need to set a umask for these you must set `umask` for each command.
- `-e CHOWN_HOME=yes` - Instructs the startup script to change the `${NB_USER}` home directory owner and group to the current value of `${NB_UID}` and `${NB_GID}`.
  This change will take effect even if the user home directory is mounted from the host using `-v` as described below.
  The change is **not** applied recursively by default.
  You can change modify the `chown` behavior by setting `CHOWN_HOME_OPTS` (e.g., `-e CHOWN_HOME_OPTS='-R'`).
- `-e CHOWN_EXTRA="<some dir>,<some other dir>"` - Instructs the startup script to change the owner and group of each comma-separated container directory to the current value of `${NB_UID}` and `${NB_GID}`.
  The change is **not** applied recursively by default.
  You can change modify the `chown` behavior by setting `CHOWN_EXTRA_OPTS` (e.g., `-e CHOWN_EXTRA_OPTS='-R'`).
- `-e GRANT_SUDO=yes` - Instructs the startup script to grant the `NB_USER` user passwordless `sudo` capability.
  You do **not** need this option to allow the user to `conda` or `pip` install additional packages.
  This option is useful, however, when you wish to give `${NB_USER}` the ability to install OS packages with `apt` or modify other root-owned files in the container.
  For this option to take effect, you must run the container with `--user root`.
  (The `start-notebook.sh` script will `su ${NB_USER}` after adding `${NB_USER}` to sudoers.)
  **You should only enable `sudo` if you trust the user or if the container is running on an isolated host.**
- `-e GEN_CERT=yes` - Instructs the startup script to generates a self-signed SSL certificate and configure Jupyter Notebook to use it to accept encrypted HTTPS connections.
- `-e JUPYTER_ENABLE_LAB=yes` - Instructs the startup script to run `jupyter lab` instead of the default `jupyter notebook` command.
  Useful in container orchestration environments where setting environment variables is easier than change command line parameters.
- `-e RESTARTABLE=yes` - Runs Jupyter in a loop so that quitting Jupyter does not cause the container to exit.
  This may be useful when you need to install extensions that require restarting Jupyter.
- `-v /some/host/folder/for/work:/home/jovyan/work` - Mounts a host machine directory as folder in the container.
  Useful when you want to preserve notebooks and other work even after the container is destroyed.
  **You must grant the within-container notebook user or group (`NB_UID` or `NB_GID`) write access to the host directory (e.g., `sudo chown 1000 /some/host/folder/for/work`).**
- `--user 5000 --group-add users` - Launches the container with a specific user ID and adds that user to the `users` group so that it can modify files in the default home directory and `/opt/conda`.
  You can use these arguments as alternatives to setting `${NB_UID}` and `${NB_GID}`.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

## Startup Hooks

You can further customize the container environment by adding shell scripts (`*.sh`) to be sourced
or executables (`chmod +x`) to be run to the paths below:

<<<<<<< HEAD
* `/usr/local/bin/start-notebook.d/` - handled before any of the standard options noted above
  are applied
* `/usr/local/bin/before-notebook.d/` - handled after all of the standard options noted above are
=======
- `/usr/local/bin/start-notebook.d/` - handled before any of the standard options noted above
  are applied
- `/usr/local/bin/before-notebook.d/` - handled after all of the standard options noted above are
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
  applied and just before the notebook server launches

See the `run-hooks` function in the [`jupyter/base-notebook start.sh`](https://github.com/jupyter/docker-stacks/blob/master/base-notebook/start.sh)
script for execution details.

## SSL Certificates

<<<<<<< HEAD
You may mount SSL key and certificate files into a container and configure Jupyter Notebook to use them to accept HTTPS connections. For example, to mount a host folder containing a `notebook.key` and `notebook.crt` and use them, you might run the following:
=======
You may mount SSL key and certificate files into a container and configure Jupyter Notebook to use them to accept HTTPS connections.
For example, to mount a host folder containing a `notebook.key` and `notebook.crt` and use them, you might run the following:
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

```bash
docker run -d -p 8888:8888 \
    -v /some/host/folder:/etc/ssl/notebook \
    jupyter/base-notebook start-notebook.sh \
    --NotebookApp.keyfile=/etc/ssl/notebook/notebook.key
    --NotebookApp.certfile=/etc/ssl/notebook/notebook.crt
```

<<<<<<< HEAD
Alternatively, you may mount a single PEM file containing both the key and certificate. For example:
=======
Alternatively, you may mount a single PEM file containing both the key and certificate.
For example:
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

```bash
docker run -d -p 8888:8888 \
    -v /some/host/folder/notebook.pem:/etc/ssl/notebook.pem \
    jupyter/base-notebook start-notebook.sh \
    --NotebookApp.certfile=/etc/ssl/notebook.pem
```

<<<<<<< HEAD
In either case, Jupyter Notebook expects the key and certificate to be a base64 encoded text file. The certificate file or PEM may contain one or more certificates (e.g., server, intermediate, and root).

For additional information about using SSL, see the following:

* The [docker-stacks/examples](https://github.com/jupyter/docker-stacks/tree/master/examples) for information about how to use [Let's Encrypt](https://letsencrypt.org/) certificates when you run these stacks on a publicly visible domain.
* The [jupyter_notebook_config.py](https://github.com/jupyter/docker-stacks/blob/master/base-notebook/jupyter_notebook_config.py) file for how this Docker image generates a self-signed certificate.
* The [Jupyter Notebook documentation](https://jupyter-notebook.readthedocs.io/en/latest/public_server.html#securing-a-notebook-server) for best practices about securing a public notebook server in general.
=======
In either case, Jupyter Notebook expects the key and certificate to be a base64 encoded text file.
The certificate file or PEM may contain one or more certificates (e.g., server, intermediate, and root).

For additional information about using SSL, see the following:

- The [docker-stacks/examples](https://github.com/jupyter/docker-stacks/tree/master/examples) for information about how to use
  [Let's Encrypt](https://letsencrypt.org/) certificates when you run these stacks on a publicly visible domain.
- The [jupyter_notebook_config.py](https://github.com/jupyter/docker-stacks/blob/master/base-notebook/jupyter_notebook_config.py) file for how this Docker image generates a self-signed certificate.
- The [Jupyter Notebook documentation](https://jupyter-notebook.readthedocs.io/en/latest/public_server.html#securing-a-notebook-server) for best practices about securing a public notebook server in general.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

## Alternative Commands

### start.sh

<<<<<<< HEAD
The `start-notebook.sh` script actually inherits most of its option handling capability from a more generic `start.sh` script. The `start.sh` script supports all of the features described above, but allows you to specify an arbitrary command to execute. For example, to run the text-based `ipython` console in a container, do the following:
=======
The `start-notebook.sh` script actually inherits most of its option handling capability from a more generic `start.sh` script.
The `start.sh` script supports all of the features described above, but allows you to specify an arbitrary command to execute.
For example, to run the text-based `ipython` console in a container, do the following:
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

```bash
docker run -it --rm jupyter/base-notebook start.sh ipython
```

Or, to run JupyterLab instead of the classic notebook, run the following:

```bash
docker run -it --rm -p 8888:8888 jupyter/base-notebook start.sh jupyter lab
```

This script is particularly useful when you derive a new Dockerfile from this image and install additional Jupyter applications with subcommands like `jupyter console`, `jupyter kernelgateway`, etc.

### Others

<<<<<<< HEAD
You can bypass the provided scripts and specify an arbitrary start command. If you do, keep in mind that features supported by the `start.sh` script and its kin will not function (e.g., `GRANT_SUDO`).

## Conda Environments

The default Python 3.x [Conda environment](http://conda.pydata.org/docs/using/envs.html) resides in `/opt/conda`. The `/opt/conda/bin` directory is part of the default `jovyan` user's `$PATH`. That directory is also whitelisted for use in `sudo` commands by the `start.sh` script.

The `jovyan` user has full read/write access to the `/opt/conda` directory. You can use either `conda`, `mamba` or `pip` to install new packages without any additional permissions.

```bash
# install a package into the default (python 3.x) environment
pip install some-package
conda install some-package
mamba install some-package
=======
You can bypass the provided scripts and specify an arbitrary start command.
If you do, keep in mind that features supported by the `start.sh` script and its kin will not function (e.g., `GRANT_SUDO`).

## Conda Environments

The default Python 3.x [Conda environment](https://conda.io/projects/conda/en/latest/user-guide/concepts/environments.html) resides in `/opt/conda`.
The `/opt/conda/bin` directory is part of the default `jovyan` user's `${PATH}`.
That directory is also whitelisted for use in `sudo` commands by the `start.sh` script.

The `jovyan` user has full read/write access to the `/opt/conda` directory.
You can use either `pip`, `conda` or `mamba` to install new packages without any additional permissions.

```bash
# install a package into the default (python 3.x) environment and cleanup after the installation
pip install --quiet --no-cache-dir some-package && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

conda install --quiet --yes some-package && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

mamba install --quiet --yes some-package && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
```

### Using alternative channels

<<<<<<< HEAD
Conda is configured by default to use only the [`conda-forge`](https://anaconda.org/conda-forge) channel. 
=======
Conda is configured by default to use only the [`conda-forge`](https://anaconda.org/conda-forge) channel.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
However, alternative channels can be used either one shot by overwriting the default channel in the installation command or by configuring `conda` to use different channels.
The examples below show how to use the [anaconda default channels](https://repo.anaconda.com/pkgs/main) instead of `conda-forge` to install packages.

```bash
# using defaults channels to install a package
conda install --channel defaults humanize
# configure conda to add default channels at the top of the list
conda config --system --prepend channels defaults
# install a package
<<<<<<< HEAD
conda install humanize
```
=======
conda install --quiet --yes humanize && \
    conda clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
```
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
