# Image Tests

We greatly appreciate pull requests that extend the automated tests that vet the basic functionality
of the Docker images.

## How the Tests Work

GitHub executes `make build-test-all` against pull requests submitted to the `jupyter/docker-stacks`
<<<<<<< HEAD
repository. This `make` command builds every docker image. After building each image, the `make`
command executes `pytest` to run both image-specific tests like those in
[base-notebook/test/](https://github.com/jupyter/docker-stacks/tree/master/base-notebook/test) and
common tests defined in [test/](https://github.com/jupyter/docker-stacks/tree/master/test). Both
kinds of tests make use of global [pytest fixtures](https://docs.pytest.org/en/latest/fixture.html)
defined in the [conftest.py](https://github.com/jupyter/docker-stacks/blob/master/conftest.py) file
at the root of the projects.
=======
repository.
This `make` command builds every docker image.
After building each image, the `make` command executes `pytest` to run both image-specific tests like those in
[base-notebook/test/](https://github.com/jupyter/docker-stacks/tree/master/base-notebook/test) and
common tests defined in [test/](https://github.com/jupyter/docker-stacks/tree/master/test).
Both kinds of tests make use of global [pytest fixtures](https://docs.pytest.org/en/latest/reference/fixtures.html)
defined in the [conftest.py](https://github.com/jupyter/docker-stacks/blob/master/conftest.py) file at the root of the projects.
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

## Contributing New Tests

Please follow the process below to add new tests:

1. If the test should run against every image built, add your test code to one of the modules in
   [test/](https://github.com/jupyter/docker-stacks/tree/master/test) or create a new module.
2. If your test should run against a single image, add your test code to one of the modules in
   `some-notebook/test/` or create a new module.
<<<<<<< HEAD
3. Build one or more images you intend to test and run the tests locally. If you use `make`, call:
=======
3. Build one or more images you intend to test and run the tests locally.
   If you use `make`, call:

>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
   ```bash
   make build/somestack-notebook
   make test/somestack-notebook
   ```
<<<<<<< HEAD
=======

>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
4. [Submit a pull request](https://github.com/PointCloudLibrary/pcl/wiki/A-step-by-step-guide-on-preparing-and-submitting-a-pull-request)
   (PR) with your changes.
5. Watch for GitHub to report a build success or failure for your PR on GitHub.
6. Discuss changes with the maintainers and address any issues running the tests on GitHub.
