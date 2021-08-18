# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
import logging

import pytest

LOGGER = logging.getLogger(__name__)


@pytest.mark.skip(reason="Not yet compliant with JupyterLab 3")
@pytest.mark.parametrize(
    "extension",
    [
        "@bokeh/jupyter_bokeh",
        "@jupyter-widgets/jupyterlab-manager",
        "jupyter-matplotlib",
    ],
)
def test_check_extension(container, extension):
    """Basic check of each extension

    The list of extensions can be obtained through this command

    $ jupyter labextension list

    """
    LOGGER.info(f"Checking the extension: {extension} ...")
    c = container.run(
<<<<<<< HEAD
        tty=True, command=["start.sh", "jupyter", "labextension", "check", extension]
=======
        tty=True,
        command=["start.sh", "jupyter", "labextension", "check", extension],
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    )
    rv = c.wait(timeout=10)
    logs = c.logs(stdout=True).decode("utf-8")
    LOGGER.debug(logs)
    assert rv == 0 or rv["StatusCode"] == 0, f"Extension {extension} check failed"
