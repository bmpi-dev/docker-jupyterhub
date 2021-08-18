# Matplotlit: Create a simple plot example.
# Refs: https://matplotlib.org/3.1.1/gallery/lines_bars_and_markers/simple_plot.html

# Optional test with [Matplotlib Jupyter Integration](https://github.com/matplotlib/ipympl)
# %matplotlib widget
import matplotlib.pyplot as plt
import numpy as np
import os

# Data for plotting
t = np.arange(0.0, 2.0, 0.01)
s = 1 + np.sin(2 * np.pi * t)

fig, ax = plt.subplots()
ax.plot(t, s)

<<<<<<< HEAD
ax.set(xlabel='time (s)', ylabel='voltage (mV)',
       title='About as simple as it gets, folks')
=======
ax.set(
    xlabel="time (s)",
    ylabel="voltage (mV)",
    title="About as simple as it gets, folks",
)
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
ax.grid()
# Note that the test can be run headless by checking if an image is produced
file_path = os.path.join("/tmp", "test.png")
fig.savefig(file_path)
print(f"File {file_path} saved")
