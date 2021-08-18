# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

import logging

LOGGER = logging.getLogger(__name__)


def test_inkscape(container):
    """Inkscape shall be installed to be able to convert SVG files."""
    LOGGER.info("Test that inkscape is working by printing its version ...")
    c = container.run(
<<<<<<< HEAD
        tty=True, command=["start.sh", "bash", "-c", "inkscape --version"]
=======
        tty=True,
        command=["start.sh", "bash", "-c", "inkscape --version"],
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    )
    c.wait(timeout=10)
    logs = c.logs(stdout=True).decode("utf-8")
    LOGGER.debug(logs)
    assert "Inkscape" in logs, "Inkscape not installed or not working"
