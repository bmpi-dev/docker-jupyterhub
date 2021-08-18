# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.

import logging

import pytest
import os

LOGGER = logging.getLogger(__name__)
<<<<<<< HEAD


@pytest.mark.parametrize("test_file,expected_file,description",
                         [
                             ("matplotlib_1.py", "test.png",
                              "Test that matplotlib is able to plot a graph and write it as an image ..."),
                             ("matplotlib_fonts_1.py", "test_fonts.png",
                              "Test cm-super latex labels in matplotlib ...")
                         ])
=======
THIS_DIR = os.path.dirname(os.path.realpath(__file__))


@pytest.mark.parametrize(
    "test_file,expected_file,description",
    [
        (
            "matplotlib_1.py",
            "test.png",
            "Test that matplotlib is able to plot a graph and write it as an image ...",
        ),
        (
            "matplotlib_fonts_1.py",
            "test_fonts.png",
            "Test cm-super latex labels in matplotlib ...",
        ),
    ],
)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
def test_matplotlib(container, test_file, expected_file, description):
    """Various tests performed on matplotlib

    - Test that matplotlib is able to plot a graph and write it as an image
    - Test matplotlib latex fonts, which depend on the cm-super package
    """
<<<<<<< HEAD
    host_data_dir = os.path.join(os.path.dirname(
        os.path.realpath(__file__)), "data")
=======
    host_data_dir = os.path.join(THIS_DIR, "data")
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    cont_data_dir = "/home/jovyan/data"
    output_dir = "/tmp"
    LOGGER.info(description)
    command = "sleep infinity"
    running_container = container.run(
        volumes={host_data_dir: {"bind": cont_data_dir, "mode": "ro"}},
        tty=True,
        command=["start.sh", "bash", "-c", command],
    )
    command = f"python {cont_data_dir}/{test_file}"
    cmd = running_container.exec_run(command)
<<<<<<< HEAD
    assert cmd.exit_code == 0, f"Command {command} failed"
    LOGGER.debug(cmd.output.decode("utf-8"))
=======
    LOGGER.debug(cmd.output.decode("utf-8"))
    assert cmd.exit_code == 0, f"Command {command} failed"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
    # Checking if the file is generated
    # https://stackoverflow.com/a/15895594/4413446
    command = f"test -s {output_dir}/{expected_file}"
    cmd = running_container.exec_run(command)
<<<<<<< HEAD
    assert cmd.exit_code == 0, f"Command {command} failed"
    LOGGER.debug(cmd.output.decode("utf-8"))
=======
    LOGGER.debug(cmd.output.decode("utf-8"))
    assert cmd.exit_code == 0, f"Command {command} failed"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
