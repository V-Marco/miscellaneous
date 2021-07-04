from tkinter import *
from PIL import Image, ImageTk
import numpy as np
import matplotlib.pyplot as plt


root = Tk()
root.title("Matplotlib")
root.geometry("400x400")

def graph():
    np.random.seed(123)
    house_prices = np.random.normal(200000, 25000, 5000)
    plt.hist(house_prices)
    plt.show()

myButton = Button(root, text = "Graph It!", command = graph)
myButton.pack()

root.mainloop()