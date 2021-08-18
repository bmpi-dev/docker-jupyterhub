<<<<<<< HEAD
# ONLYOFFICE on Docker

![](https://libs.websoft9.com/common/websott9-cloud-installer.png) 

## Introduction

[English](/README.md) | [简体中文](/README-zh.md)  

This repository is an **Cloud Native solution** powered by [Websoft9](https://www.websoft9.com), it simplifies the complicated installation and initialization process.  

## System Requirements

The following are the minimal [recommended requirements](https://github.com/onlyoffice/docker#recommended-system-requirements):

* **OS**: Red Hat, CentOS, Debian, Ubuntu or other's Linux OS
* **Public Cloud**: More than 20+ major Cloud such as AWS, Azure, Google Cloud, Alibaba Cloud, HUAWEIClOUD, Tencent Cloud
* **Private Cloud**: KVM, VMware, VirtualBox, OpenStack
* **ARCH**:  Linux x86-64, ARM 32/64, Windows x86-64, IBM POWER8, x86/i686
* **RAM**: 4 GB or more
* **CPU**: 2 cores or higher
* **HDD**: at least 20 GB of free space
* **Swap file**: at least 2 GB
* **bandwidth**: more fluent experience over 100M  

## QuickStart

### All-in-one Installer

Use SSH to connect your instance and run the automatic installation script below

```
sudo wget -N https://raw.githubusercontent.com/Websoft9/StackHub/main/docker-installer.sh; sudo bash docker-installer.sh -r onlyoffice
```
### package install

1.Make package
You can get the  package as following script
```
sudo wget -N https://raw.githubusercontent.com/Websoft9/StackHub/main/docker-installer.sh; sudo bash docker-installer.sh -r onlyoffice -p
```

2.Install by package
Copy package to your server, Use SSH to connect your instance and run the automatic installation script below
```
sudo bash install-onlyoffice
```

### Manual Installation

#### Preparation

If you have not install Docker and Docker-Compose, refer to the following commands to install it:

```
curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
ln -sf /usr/local/bin/docker-compose  /usr/bin
sudo systemctl start docker
```

#### Install ONLYOFFICE

We assume that you are already familiar with Docker, and you can modify [docker-compose file](docker-compose-production.yml) by yourself

```
git clone --depth=1 https://github.com/Websoft9/docker-onlyoffice
cd docker-onlyoffice
docker-compose -f docker-compose-production.yml  up -d
```

### FAQ

#### Do I need to change the password before docker-compose up?
Yes, you should modify all database password and application password at docker-compose file for production

#### Docker runing failed for the reason that port conflict?
You should modify ports at [docker-compose file](docker-compose-production.yml) and docker-compose again

#### question1  
answer1  

#### question2  
answer2  

### Usage instructions

You can point your browser to: *`http://Instance's Internet IP:9002`*  

The following is the information that may be needed during use

#### Credentials

By default, the available users are:

| Username    | Password |
| ------- | -------- |
|  admin | 123456  |

#### Services and Ports

| Service | Port | Use |  Necessity |
| --- | --- | --- | --- |
| onlyoffice-server | 9002 | Web-GUI database management tool | Y |
| phpmyadmin | 9090 | Web-GUI database management tool | Y |
## Documentation

[ONLYOFFICE Administrator Guide](https://support.websoft9.com/docs/onlyoffice)

## Enterprise Support

If you want to get our Enterprise Support to ensure high availability of applications, you can subscribe our [ONLYOFFICE Enterprise Support](https://apps.websoft9.com/onlyoffice) 

What you get with a Enterprise Support subscription?

* Knowledge: Answers and guidance from product experts
* Support: Everything you need for technical support, e.g Enable HTTPS, Upgrade guide
* Security: Security services and tools to protect your software
=======
# Jupyter Docker Stacks

[![Github actions badge](https://github.com/jupyter/docker-stacks/actions/workflows/docker.yml/badge.svg)](https://github.com/jupyter/docker-stacks/actions/workflows/docker.yml "Docker images build status")
[![Read the Docs badge](https://img.shields.io/readthedocs/jupyter-docker-stacks.svg)](https://jupyter-docker-stacks.readthedocs.io/en/latest/ "Documentation build status")
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/jupyter/docker-stacks/master.svg)](https://results.pre-commit.ci/latest/github/jupyter/docker-stacks/master "pre-commit.ci build status")
[![Discourse badge](https://img.shields.io/discourse/https/discourse.jupyter.org/users.svg?color=%23f37626)](https://discourse.jupyter.org/ "Jupyter Discourse Forum")
[![Binder badge](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jupyter/docker-stacks/master?filepath=README.ipynb "Launch a jupyter/base-notebook container on mybinder.org")

Jupyter Docker Stacks are a set of ready-to-run [Docker images](https://hub.docker.com/u/jupyter)
containing Jupyter applications and interactive computing tools.

## Quick Start

You can try a [relatively recent build of the jupyter/base-notebook image on mybinder.org](https://mybinder.org/v2/gh/jupyter/docker-stacks/master?filepath=README.ipynb)
by simply clicking the preceding link.
The image used in binder was last updated on 22 May 2021.
Otherwise, three examples below may help you get started if you [have Docker installed](https://docs.docker.com/install/),
know [which Docker image](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html) you want to use
and want to launch a single Jupyter Notebook server in a container.

The [User Guide on ReadTheDocs](https://jupyter-docker-stacks.readthedocs.io/) describes additional uses and features in detail.

**Example 1:** This command pulls the `jupyter/scipy-notebook` image tagged `33add21fab64` from Docker Hub if it is not already present on the local host.
It then starts a container running a Jupyter Notebook server and exposes the server on host port 8888.
The server logs appear in the terminal.
Visiting `http://<hostname>:8888/?token=<token>` in a browser loads the Jupyter Notebook dashboard page,
where `hostname` is the name of the computer running docker and `token` is the secret token printed in the console.
The container remains intact for restart after the notebook server exits.

```bash
docker run -p 8888:8888 jupyter/scipy-notebook:33add21fab64
```

**Example 2:** This command performs the same operations as **Example 1**, but it exposes the server on host port 10000 instead of port 8888.
Visiting `http://<hostname>:10000/?token=<token>` in a browser loads Jupyter Notebook server,
where `hostname` is the name of the computer running docker and `token` is the secret token printed in the console.

```bash
docker run -p 10000:8888 jupyter/scipy-notebook:33add21fab64
```

**Example 3:** This command pulls the `jupyter/datascience-notebook` image tagged `33add21fab64` from Docker Hub if it is not already present on the local host.
It then starts an _ephemeral_ container running a Jupyter Notebook server and exposes the server on host port 10000.
The command mounts the current working directory on the host as `/home/jovyan/work` in the container.
The server logs appear in the terminal.
Visiting `http://<hostname>:10000/?token=<token>` in a browser loads JupyterLab,
where `hostname` is the name of the computer running docker and `token` is the secret token printed in the console.
Docker destroys the container after notebook server exit, but any files written to `~/work` in the container remain intact on the host.

```bash
docker run --rm -p 10000:8888 -e JUPYTER_ENABLE_LAB=yes -v "${PWD}":/home/jovyan/work jupyter/datascience-notebook:33add21fab64
```

## Contributing

Please see the [Contributor Guide on ReadTheDocs](https://jupyter-docker-stacks.readthedocs.io/) for
information about how to contribute package updates, recipes, features, tests, and community
maintained stacks.

## Maintainer Help Wanted

We value all positive contributions to the Docker stacks project,
from [bug reports](https://jupyter-docker-stacks.readthedocs.io/en/latest/contributing/issues.html)
to [pull requests](https://jupyter-docker-stacks.readthedocs.io/en/latest/contributing/packages.html)
to [translations](https://jupyter-docker-stacks.readthedocs.io/en/latest/contributing/translations.html)
to help answering questions.
We'd also like to invite members of the community to help with two maintainer activities:

- Issue triage: Reading and providing a first response to issues, labeling issues appropriately,
  redirecting cross-project questions to Jupyter Discourse
- Pull request reviews: Reading proposed documentation and code changes, working with the submitter
  to improve the contribution, deciding if the contribution should take another form (e.g., a recipe
  instead of a permanent change to the images)

Anyone in the community can jump in and help with these activities at any time
We will happily grant additional permissions (e.g., ability to merge PRs) to anyone who shows an on-going interest in working on the project.

## Jupyter Notebook Deprecation Notice

Following [Jupyter Notebook notice](https://github.com/jupyter/notebook#notice), we encourage users to transition to JupyterLab.
This can be done by passing the environment variable `JUPYTER_ENABLE_LAB=yes` at container startup,
more information is available in the [documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#docker-options).

At some point, JupyterLab will become the default for all of the Jupyter Docker stack images, however a new environment variable will be introduced to switch back to Jupyter Notebook if needed.

After the change of default, and according to the Jupyter Notebook project status and its compatibility with JupyterLab,
these Docker images may remove the classic Jupyter Notebook interface altogether in favor of another _classic-like_ UI built atop JupyterLab.

This change is tracked in the issue [#1217](https://github.com/jupyter/docker-stacks/issues/1217), please check its content for more information.

## Alternatives

- [jupyter/repo2docker](https://github.com/jupyter/repo2docker) - Turn git repositories into
  Jupyter-enabled Docker Images
- [openshift/source-to-image](https://github.com/openshift/source-to-image) - A tool for
  building/building artifacts from source and injecting into docker images
- [jupyter-on-openshift/jupyter-notebooks](https://github.com/jupyter-on-openshift/jupyter-notebooks) -
  OpenShift compatible S2I builder for basic notebook images

## Resources

- [Documentation on ReadTheDocs](https://jupyter-docker-stacks.readthedocs.io/)
- [Issue Tracker on GitHub](https://github.com/jupyter/docker-stacks)
- [Jupyter Discourse Forum](https://discourse.jupyter.org/)
- [Jupyter Website](https://jupyter.org)
- [Images on DockerHub](https://hub.docker.com/u/jupyter)

## CPU Architectures

All published containers support amd64 (x86_64). The base-notebook and
minimal-notebook containers also support arm64. The ambition is to have all
containers support both amd64 and arm64.

### Caveats for arm64 images

- The manifests we publish in this projects wiki as well as the image tags for
  the multi platform images that also support arm, are all based on the amd64
  version even though details about the installed packages versions could differ
  between architectures. For the status about this, see
  [#1401](https://github.com/jupyter/docker-stacks/issues/1401).
- Only the amd64 images are actively tested currently. For the status about
  this, see [#1402](https://github.com/jupyter/docker-stacks/issues/1402).
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
