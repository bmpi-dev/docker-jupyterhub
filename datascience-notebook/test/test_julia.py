# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
import logging

LOGGER = logging.getLogger(__name__)


def test_julia(container):
    """Basic julia test"""
    LOGGER.info("Test that julia is correctly installed ...")
    running_container = container.run(
<<<<<<< HEAD
        tty=True, command=["start.sh", "bash", "-c", "sleep infinity"]
=======
        tty=True,
        command=["start.sh", "bash", "-c", "sleep infinity"],
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    )
    command = "julia --version"
    cmd = running_container.exec_run(command)
    output = cmd.output.decode("utf-8")
<<<<<<< HEAD
    assert cmd.exit_code == 0, f"Command {command} failed {output}"
    LOGGER.debug(output)
=======
    LOGGER.debug(output)
    assert cmd.exit_code == 0, f"Command {command} failed {output}"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
