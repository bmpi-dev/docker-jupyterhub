# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
import logging


LOGGER = logging.getLogger(__name__)


def test_spark_shell(container):
    """Checking if Spark (spark-shell) is running properly"""
    c = container.run(
        tty=True,
<<<<<<< HEAD
        command=['start.sh', 'bash', '-c', 'spark-shell <<< "1+1"']
    )
    c.wait(timeout=60)
    logs = c.logs(stdout=True).decode('utf-8')
    LOGGER.debug(logs)
    assert 'res0: Int = 2' in logs, "spark-shell does not work"


def test_pyspark(container):
    """PySpark should be in the Python path"""
    c = container.run(
        tty=True,
        command=['start.sh', 'python', '-c', 'import pyspark']
    )
    rv = c.wait(timeout=30)
    assert rv == 0 or rv["StatusCode"] == 0, "pyspark not in PYTHONPATH"
    logs = c.logs(stdout=True).decode('utf-8')
    LOGGER.debug(logs)
=======
        command=["start.sh", "bash", "-c", 'spark-shell <<< "1+1"'],
    )
    c.wait(timeout=60)
    logs = c.logs(stdout=True).decode("utf-8")
    LOGGER.debug(logs)
    assert "res0: Int = 2" in logs, "spark-shell does not work"
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
