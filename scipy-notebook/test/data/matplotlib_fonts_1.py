# Matplotlit: Test tex fonts
import matplotlib
import matplotlib.pyplot as plt
import os

<<<<<<< HEAD
matplotlib.rcParams['pgf.texsystem'] = 'pdflatex'
matplotlib.rcParams.update({'font.family': 'serif', 'font.size': 18,
                            'axes.labelsize': 20, 'axes.titlesize': 24,
                            'figure.titlesize': 28})
matplotlib.rcParams['text.usetex'] = True
=======
matplotlib.rcParams["pgf.texsystem"] = "pdflatex"
matplotlib.rcParams.update(
    {
        "font.family": "serif",
        "font.size": 18,
        "axes.labelsize": 20,
        "axes.titlesize": 24,
        "figure.titlesize": 28,
    }
)
matplotlib.rcParams["text.usetex"] = True
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90

fig, ax = plt.subplots(1, 1)
x = [1, 2]
y = [1, 2]
<<<<<<< HEAD
ax.plot(x, y, label='a label')
=======
ax.plot(x, y, label="a label")
>>>>>>> 70178b8e48d7825ceade6e2decf374bc3e792d90
ax.legend(fontsize=15)

file_path = os.path.join("/tmp", "test_fonts.png")
fig.savefig(file_path)
print(f"File {file_path} saved")
