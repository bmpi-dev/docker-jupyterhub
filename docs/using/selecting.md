# Selecting an Image

- [Core Stacks](#core-stacks)
- [Image Relationships](#image-relationships)
- [Community Stacks](#community-stacks)

Using one of the Jupyter Docker Stacks requires two choices:

1. Which Docker image you wish to use
2. How you wish to start Docker containers from that image

This section provides details about the first.

## Core Stacks

<<<<<<< HEAD
The Jupyter team maintains a set of Docker image definitions in the
[https://github.com/jupyter/docker-stacks](https://github.com/jupyter/docker-stacks) GitHub
repository. The following sections describe these images including their contents, relationships,
and versioning strategy.
=======
The Jupyter team maintains a set of Docker image definitions in the <https://github.com/jupyter/docker-stacks> GitHub repository.
The following sections describe these images including their contents, relationships, and versioning strategy.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/base-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/base-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/base-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/base-notebook/tags/)

`jupyter/base-notebook` is a small image supporting the
[options common across all core stacks](common.md). It is the basis for all other stacks.
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/base-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/base-notebook/tags/)

`jupyter/base-notebook` is a small image supporting the [options common across all core stacks](common.md).
It is the basis for all other stacks.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

- Minimally-functional Jupyter Notebook server (e.g., no LaTeX support for saving notebooks as PDFs)
- [Miniforge](https://github.com/conda-forge/miniforge) Python 3.x in `/opt/conda` with two package managers
  - [conda](https://github.com/conda/conda): "cross-platform, language-agnostic binary package manager".
  - [mamba](https://github.com/mamba-org/mamba): "reimplementation of the conda package manager in C++".
<<<<<<< HEAD
=======
- `notebook`, `jupyterhub` and `jupyterlab` packages
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
- No preinstalled scientific computing packages
- Unprivileged user `jovyan` (`uid=1000`, configurable, see options) in group `users` (`gid=100`)
  with ownership over the `/home/jovyan` and `/opt/conda` paths
- `tini` as the container entrypoint and a `start-notebook.sh` script as the default command
- A `start-singleuser.sh` script useful for launching containers in JupyterHub
<<<<<<< HEAD
- A `start.sh` script useful for running alternative commands in the container (e.g. `ipython`,
  `jupyter kernelgateway`, `jupyter lab`)
=======
- A `start.sh` script useful for running alternative commands in the container (e.g. `ipython`, `jupyter kernelgateway`, `jupyter lab`)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
- Options for a self-signed HTTPS certificate and passwordless sudo

### jupyter/minimal-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/minimal-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/minimal-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/minimal-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/minimal-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/minimal-notebook` adds command line tools useful when working in Jupyter applications.

- Everything in `jupyter/base-notebook`
- [TeX Live](https://www.tug.org/texlive/) for notebook document conversion
- [git](https://git-scm.com/),
<<<<<<< HEAD
  [vi](https://vim.org/) (actually `vim-tiny`),
  [nano](https://www.nano-editor.org/) (actually `nano-tiny`), tzdata, and unzip
=======
  [vi](https://www.vim.org) (actually `vim-tiny`),
  [nano](https://www.nano-editor.org/) (actually `nano-tiny`), `tzdata`, and `unzip`
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/r-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/r-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/r-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/r-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/r-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/r-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/r-notebook` includes popular packages from the R ecosystem.

- Everything in `jupyter/minimal-notebook` and its ancestor images
- The [R](https://www.r-project.org/) interpreter and base environment
- [IRKernel](https://irkernel.github.io/) to support R code in Jupyter notebooks
<<<<<<< HEAD
- [tidyverse](https://www.tidyverse.org/) packages from
  [conda-forge](https://conda-forge.github.io/feedstocks)
- [devtools](https://cran.r-project.org/web/packages/devtools/index.html),
  [shiny](https://shiny.rstudio.com/), [rmarkdown](http://rmarkdown.rstudio.com/),
  [forecast](https://cran.r-project.org/web/packages/forecast/forecast.pdf),
  [rsqlite](https://cran.r-project.org/web/packages/RSQLite/index.html),
  [nycflights13](https://cran.r-project.org/web/packages/nycflights13/index.html),
  [caret](http://topepo.github.io/caret/index.html), [tidymodels](https://www.tidymodels.org/),
  [rcurl](https://cran.r-project.org/web/packages/RCurl/index.html), and
  [randomforest](https://cran.r-project.org/web/packages/randomForest/randomForest.pdf) packages
  from [conda-forge](https://conda-forge.github.io/feedstocks)
=======
- [tidyverse](https://www.tidyverse.org/)
  packages from [conda-forge](https://conda-forge.org/feedstock-outputs/index.html)
- [caret](https://topepo.github.io/caret/index.html),
  [crayon](https://cran.r-project.org/web/packages/crayon/index.html),
  [devtools](https://cran.r-project.org/web/packages/devtools/index.html),
  [forecast](https://cran.r-project.org/web/packages/forecast/index.html),
  [hexbin](https://cran.r-project.org/web/packages/hexbin/index.html),
  [htmltools](https://cran.r-project.org/web/packages/htmltools/index.html),
  [htmlwidgets](https://www.htmlwidgets.org),
  [nycflights13](https://cran.r-project.org/web/packages/nycflights13/index.html),
  [randomforest](https://cran.r-project.org/web/packages/randomForest/index.html),
  [rcurl](https://cran.r-project.org/web/packages/RCurl/index.html),
  [rmarkdown](https://rmarkdown.rstudio.com),
  [rodbc](https://cran.r-project.org/web/packages/RODBC/index.html),
  [rsqlite](https://cran.r-project.org/web/packages/RSQLite/index.html),
  [shiny](https://shiny.rstudio.com/),
  [tidymodels](https://www.tidymodels.org/),
  [unixodbc](http://www.unixodbc.org)
  packages from [conda-forge](https://conda-forge.org/feedstock-outputs/index.html)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/scipy-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/scipy-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/scipy-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/scipy-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/scipy-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/scipy-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/scipy-notebook` includes popular packages from the scientific Python ecosystem.

- Everything in `jupyter/minimal-notebook` and its ancestor images
<<<<<<< HEAD
- [dask](https://dask.org/), [pandas](https://pandas.pydata.org/),
  [numexpr](https://github.com/pydata/numexpr), [matplotlib](https://matplotlib.org/),
  [scipy](https://www.scipy.org/), [seaborn](https://seaborn.pydata.org/),
  [scikit-learn](http://scikit-learn.org/stable/), [scikit-image](http://scikit-image.org/),
  [sympy](http://www.sympy.org/en/index.html), [cython](http://cython.org/),
  [patsy](https://patsy.readthedocs.io/en/latest/),
  [statsmodel](http://www.statsmodels.org/stable/index.html),
  [cloudpickle](https://github.com/cloudpipe/cloudpickle),
  [dill](https://pypi.python.org/pypi/dill), [numba](https://numba.pydata.org/),
  [bokeh](https://bokeh.pydata.org/en/latest/), [sqlalchemy](https://www.sqlalchemy.org/),
  [hdf5](http://www.h5py.org/), [vincent](http://vincent.readthedocs.io/en/latest/),
  [beautifulsoup](https://www.crummy.com/software/BeautifulSoup/),
  [protobuf](https://developers.google.com/protocol-buffers/docs/pythontutorial),
  [xlrd](http://www.python-excel.org/), [bottleneck](https://bottleneck.readthedocs.io/en/latest/),
  and [pytables](https://www.pytables.org/) packages
- [ipywidgets](https://ipywidgets.readthedocs.io/en/stable/) and
  [ipympl](https://github.com/matplotlib/jupyter-matplotlib) for interactive visualizations and
  plots in Python notebooks
- [Facets](https://github.com/PAIR-code/facets) for visualizing machine learning datasets
=======
- [altair](https://altair-viz.github.io),
  [beautifulsoup4](https://www.crummy.com/software/BeautifulSoup/),
  [bokeh](https://docs.bokeh.org/en/latest/),
  [bottleneck](https://bottleneck.readthedocs.io/en/latest/),
  [cloudpickle](https://github.com/cloudpipe/cloudpickle),
  [conda-forge::blas=\*=openblas](https://www.openblas.net),
  [cython](https://cython.org),
  [dask](https://dask.org/),
  [dill](https://pypi.org/project/dill/),
  [h5py](https://www.h5py.org),
  [matplotlib-base](https://matplotlib.org/),
  [numba](https://numba.pydata.org/),
  [numexpr](https://github.com/pydata/numexpr),
  [pandas](https://pandas.pydata.org/),
  [patsy](https://patsy.readthedocs.io/en/latest/),
  [protobuf](https://developers.google.com/protocol-buffers/docs/pythontutorial),
  [pytables](https://www.pytables.org/),
  [scikit-image](https://scikit-image.org),
  [scikit-learn](https://scikit-learn.org/stable/),
  [scipy](https://www.scipy.org/),
  [seaborn](https://seaborn.pydata.org/),
  [sqlalchemy](https://www.sqlalchemy.org/),
  [statsmodel](https://www.statsmodels.org/stable/index.html),
  [sympy](https://www.sympy.org/en/index.html),
  [widgetsnbextension](https://ipywidgets.readthedocs.io/en/latest/user_install.html#installing-in-classic-jupyter-notebook),
  [xlrd](https://www.python-excel.org)
  packages
- [ipympl](https://github.com/matplotlib/ipympl) and
  [ipywidgets](https://ipywidgets.readthedocs.io/en/stable/)
  for interactive visualizations and plots in Python notebooks
- [Facets](https://github.com/PAIR-code/facets)
  for visualizing machine learning datasets
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/tensorflow-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/tensorflow-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/tensorflow-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/tensorflow-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/tensorflow-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/tensorflow-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/tensorflow-notebook` includes popular Python deep learning libraries.

- Everything in `jupyter/scipy-notebook` and its ancestor images
<<<<<<< HEAD
- [tensorflow](https://www.tensorflow.org/) and [keras](https://keras.io/) machine learning
  libraries
=======
- [tensorflow](https://www.tensorflow.org/) machine learning library
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/datascience-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/datascience-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/datascience-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/datascience-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/datascience-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/datascience-notebook` includes libraries for data analysis from the Julia, Python, and R
communities.

- Everything in the `jupyter/scipy-notebook` and `jupyter/r-notebook` images, and their ancestor
  images
<<<<<<< HEAD
- The [Julia](https://julialang.org/) compiler and base environment
- [IJulia](https://github.com/JuliaLang/IJulia.jl) to support Julia code in Jupyter notebooks
- [HDF5](https://github.com/JuliaIO/HDF5.jl), [Gadfly](http://gadflyjl.org/stable/), and
  [RDatasets](https://github.com/johnmyleswhite/RDatasets.jl) packages
=======
- [rpy2](https://rpy2.github.io/doc/latest/html/index.html) package
- The [Julia](https://julialang.org/) compiler and base environment
- [IJulia](https://github.com/JuliaLang/IJulia.jl) to support Julia code in Jupyter notebooks
- [HDF5](https://github.com/JuliaIO/HDF5.jl),
  [Gadfly](https://gadflyjl.org/stable/),
  [RDatasets](https://github.com/JuliaStats/RDatasets.jl)
  packages
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/pyspark-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/pyspark-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/pyspark-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/pyspark-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/pyspark-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/pyspark-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/pyspark-notebook` includes Python support for Apache Spark.

- Everything in `jupyter/scipy-notebook` and its ancestor images
- [Apache Spark](https://spark.apache.org/) with Hadoop binaries
<<<<<<< HEAD
=======
- [pyarrow](https://arrow.apache.org/docs/python/) library
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

### jupyter/all-spark-notebook

[Source on GitHub](https://github.com/jupyter/docker-stacks/tree/master/all-spark-notebook) |
<<<<<<< HEAD
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/all-spark-notebook/Dockerfile)
| [Docker Hub image tags](https://hub.docker.com/r/jupyter/all-spark-notebook/tags/)
=======
[Dockerfile commit history](https://github.com/jupyter/docker-stacks/commits/master/all-spark-notebook/Dockerfile) |
[Docker Hub image tags](https://hub.docker.com/r/jupyter/all-spark-notebook/tags/)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

`jupyter/all-spark-notebook` includes Python, R, and Scala support for Apache Spark.

- Everything in `jupyter/pyspark-notebook` and its ancestor images
- [IRKernel](https://irkernel.github.io/) to support R code in Jupyter notebooks
<<<<<<< HEAD
- [Apache Toree](https://toree.apache.org/) and
  [spylon-kernel](https://github.com/maxpoint/spylon-kernel) to support Scala code in Jupyter
  notebooks
- [ggplot2](http://ggplot2.org/), [sparklyr](http://spark.rstudio.com/), and
  [rcurl](https://cran.r-project.org/web/packages/RCurl/index.html) packages

### Image Relationships

The following diagram depicts the build dependency tree of the core images. (i.e., the `FROM`
statements in their Dockerfiles). Any given image inherits the complete content of all ancestor
images pointing to it.
=======
- [rcurl](https://cran.r-project.org/web/packages/RCurl/index.html),
  [sparklyr](https://spark.rstudio.com),
  [ggplot2](https://ggplot2.tidyverse.org)
  packages
- [spylon-kernel](https://github.com/vericast/spylon-kernel) to support Scala code in Jupyter notebooks

### Image Relationships

The following diagram depicts the build dependency tree of the core images. (i.e., the `FROM` statements in their Dockerfiles).
Any given image inherits the complete content of all ancestor images pointing to it.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

[![Image inheritance
diagram](../images/inherit.svg)](http://interactive.blockdiag.com/?compression=deflate&src=eJyFzTEPgjAQhuHdX9Gws5sQjGzujsaYKxzmQrlr2msMGv-71K0srO_3XGud9NNA8DSfgzESCFlBSdi0xkvQAKTNugw4QnL6GIU10hvX-Zh7Z24OLLq2SjaxpvP10lX35vCf6pOxELFmUbQiUz4oQhYzMc3gCrRt2cWe_FKosmSjyFHC6OS1AwdQWCtyj7sfh523_BI9hKlQ25YdOFdv5fcH0kiEMA)

### Builds

<<<<<<< HEAD
Pull requests to the `jupyter/docker-stacks` repository trigger builds of all images on GitHub
Actions. These images are for testing purposes only and are not saved for use. When pull requests
merge to master, all images rebuild on Docker Cloud and become available to `docker pull` from
Docker Hub.

### Versioning

The `latest` tag in each Docker Hub repository tracks the master branch `HEAD` reference on GitHub.
`latest` is a moving target, by definition, and will have backward-incompatible changes regularly.

Every image on Docker Hub also receives a 12-character tag which corresponds with the git commit SHA
that triggered the image build. You can inspect the state of the `jupyter/docker-stacks` repository
for that commit to review the definition of the image (e.g., images with tag 7c45ec67c8e7 were built
from
[https://github.com/jupyter/docker-stacks/tree/7c45ec67c8e7](https://github.com/jupyter/docker-stacks/tree/7c45ec67c8e7)).

You must refer to git-SHA image tags when stability and reproducibility are important in your work.
(e.g. `FROM jupyter/scipy-notebook:7c45ec67c8e7`,
`docker run -it --rm jupyter/scipy-notebook:7c45ec67c8e7`). You should only use `latest` when a
one-off container instance is acceptable (e.g., you want to briefly try a new library in a
notebook).
=======
Every Monday and whenever a pull requests is merged, images are rebuilt and pushed to the public container registry.

### Versioning via image tags

Whenever a docker image is pushed to the container registry, it is tagged with:

- a `latest` tag
- a 12-character git commit SHA like `b9f6ce795cfc`
- a date formatted like `2021-08-29`
- a set of software version tags like `python-3.9.6` and `lab-3.0.16`

For stability and reproducibility, you should either reference a date formatted
tag from a date before the current date (in UTC time) or a git commit SHA older
than the latest git commit SHA in the default branch of the
jupyter/docker-stacks GitHub repository.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

## Community Stacks

The core stacks are just a tiny sample of what's possible when combining Jupyter with other
<<<<<<< HEAD
technologies. We encourage members of the Jupyter community to create their own stacks based on the
core images and link them below.

- [csharp-notebook is a community Jupyter Docker Stack image. Try C# in Jupyter Notebooks](https://github.com/tlinnet/csharp-notebook).
  The image includes more than 200 Jupyter Notebooks with example C# code and can readily be tried
  online via mybinder.org. Click here to launch
  [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/tlinnet/csharp-notebook/master).

- [education-notebook is a community Jupyter Docker Stack image](https://github.com/umsi-mads/education-notebook).
  The image includes nbgrader and RISE on top of the datascience-notebook image. Click here to
  launch it on
  [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/umsi-mads/education-notebook/master).

- **crosscompass/ihaskell-notebook**

  [Source on GitHub](https://github.com/jamesdbrock/ihaskell-notebook) |
  [Dockerfile commit history](https://github.com/jamesdbrock/ihaskell-notebook/commits/master/Dockerfile)
  | [Docker Hub image tags](https://hub.docker.com/r/crosscompass/ihaskell-notebook/tags)

  `crosscompass/ihaskell-notebook` is based on [IHaskell](https://github.com/gibiansky/IHaskell).
  Includes popular packages and example notebooks.

  Try it on
  [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jamesdbrock/learn-you-a-haskell-notebook/master?urlpath=lab/tree/ihaskell_examples/ihaskell/IHaskell.ipynb)

- [java-notebook is a community Jupyter Docker Stack image](https://github.com/jbindinga/java-notebook).
  The image includes [IJava](https://github.com/SpencerPark/IJava) kernel on top of the
  minimal-notebook image. Click here to launch it on
  [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jbindinga/java-notebook/master).

- [sage-notebook](https://github.com/sharpTrick/sage-notebook) is a community Jupyter Docker Stack
  image with the [sagemath](https://sagemath.org) kernel on top of the minimal-notebook image. Click
  here to launch it on
  [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sharpTrick/sage-notebook/master).

- [GPU-Jupyter](https://github.com/iot-salzburg/gpu-jupyter/): Leverage Jupyter Notebooks with the
  power of your NVIDIA GPU and perform GPU calculations using Tensorflow and Pytorch in
  collaborative notebooks. This is done by generating a Dockerfile, that consists of the
  **nvidia/cuda** base image, the well-maintained **docker-stacks** that is integrated as submodule
  and GPU-able libraries like **Tensorflow**, **Keras** and **PyTorch** on top of it.

- [cgspatial-notebook](https://github.com/SCiO-systems/cgspatial-notebook) is a community Jupyter
  Docker Stack image. The image includes major geospatial Python & R libraries on top of the
  datascience-notebook image. Try it on
  binder:[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/SCiO-systems/cgspatial-notebook/master)

- [kotlin-notebook](https://github.com/knonm/kotlin-notebook) is a community Jupyter
  Docker Stack image. The image includes [Kotlin kernel for Jupyter/IPython](https://github.com/Kotlin/kotlin-jupyter) on top of the
  `base-notebook` image. Try it on
  Binder: [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/knonm/kotlin-notebook/main)
=======
technologies.
We encourage members of the Jupyter community to create their own stacks based on the
core images and link them below.

- [csharp-notebook is a community Jupyter Docker Stack image. Try C# in Jupyter Notebooks](https://github.com/tlinnet/csharp-notebook).
  The image includes more than 200 Jupyter Notebooks with example C# code and can readily be tried online via mybinder.org.
  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/tlinnet/csharp-notebook/master).

- [education-notebook is a community Jupyter Docker Stack image](https://github.com/umsi-mads/education-notebook).
  The image includes nbgrader and RISE on top of the datascience-notebook image.
  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/umsi-mads/education-notebook/master).

- **jamesdbrock/ihaskell-notebook**

  [Source on GitHub](https://github.com/jamesdbrock/ihaskell-notebook) |
  [Dockerfile commit history](https://github.com/jamesdbrock/ihaskell-notebook/commits/master/Dockerfile) |
  [Github container registry](https://github.com/jamesdbrock/ihaskell-notebook/pkgs/container/ihaskell-notebook)

  `jamesdbrock/ihaskell-notebook` is based on [IHaskell](https://github.com/gibiansky/IHaskell).
  Includes popular packages and example notebooks.

  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jamesdbrock/learn-you-a-haskell-notebook/master?urlpath=lab/tree/ihaskell_examples/ihaskell/IHaskell.ipynb)

- [java-notebook is a community Jupyter Docker Stack image](https://github.com/jbindinga/java-notebook).
  The image includes [IJava](https://github.com/SpencerPark/IJava) kernel on top of the minimal-notebook image.
  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/jbindinga/java-notebook/master).

- [sage-notebook](https://github.com/sharpTrick/sage-notebook)
  is a community Jupyter Docker Stack image with the [sagemath](https://www.sagemath.org) kernel on top of the minimal-notebook image.
  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/sharpTrick/sage-notebook/master).

- [GPU-Jupyter](https://github.com/iot-salzburg/gpu-jupyter/): Leverage Jupyter Notebooks with the
  power of your NVIDIA GPU and perform GPU calculations using Tensorflow and Pytorch in collaborative notebooks.
  This is done by generating a Dockerfile, that consists of the **nvidia/cuda** base image,
  the well-maintained **docker-stacks** that is integrated as submodule and
  GPU-able libraries like **Tensorflow**, **Keras** and **PyTorch** on top of it.

- [PRP GPU Jupyter repo](https://gitlab.nautilus.optiputer.net/prp/jupyter-stack/-/tree/prp) and [Registry](https://gitlab.nautilus.optiputer.net/prp/jupyter-stack/container_registry)
  PRP (Pacific Research Platform) maintained registry for jupyter stack based on NVIDIA CUDA-enabled image.
  Added the PRP image with Pytorch and some other python packages, and GUI Desktop notebook based on <https://github.com/jupyterhub/jupyter-remote-desktop-proxy>.

- [cgspatial-notebook](https://github.com/SCiO-systems/cgspatial-notebook) is a community Jupyter Docker Stack image.
  The image includes major geospatial Python & R libraries on top of the datascience-notebook image.
  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/SCiO-systems/cgspatial-notebook/master)

- [kotlin-notebook](https://github.com/knonm/kotlin-notebook) is a community Jupyter Docker Stack image.
  The image includes [Kotlin kernel for Jupyter/IPython](https://github.com/Kotlin/kotlin-jupyter) on top of the
  `base-notebook` image.
  Try it on [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/knonm/kotlin-notebook/main)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

See the [contributing guide](../contributing/stacks.md) for information about how to create your own
Jupyter Docker Stack.
