from tkinter import *
from PIL import ImageTk, Image

root = Tk()
root.title("Title")
root.geometry("400x400")

def slide():
    my_label = Label(root, text = horizontal.get()).pack()
    root.geometry(str(horizontal.get() * 3) + "x400")

def slide2(var):
    my_label = Label(root, text = horizontal.get()).pack()
    root.geometry(str(horizontal.get() * 3) + "x400")

vertical = Scale(root, from_ = 100, to = 200, command = slide2)
vertical.pack()

horizontal = Scale(root, from_= 0, to = 400, orient = HORIZONTAL)
horizontal.pack()

my_btn = Button(root, text = "Click me!", command = slide).pack()

root.mainloop()