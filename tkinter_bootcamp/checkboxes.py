from tkinter import *
from PIL import ImageTk, Image

root = Tk()
root.title("Title")
root.geometry("400x400")

var = StringVar()

c = Checkbutton(root, text = "Check this box, I dare you", variable = var, onvalue = "On", offvalue = "Off")
c.deselect()
c.pack()

myLabel = Label(root, text = var.get()).pack()

root.mainloop()