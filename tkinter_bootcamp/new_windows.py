from tkinter import *
from PIL import Image, ImageTk

root = Tk()
root.title("Title")

def open():
    # Otherwise python thinks it's a local variable and it gets deleted by python's garbage collector
    global my_image
    top = Toplevel()
    top.title("Another title")
    my_image = ImageTk.PhotoImage(Image.open("images/pencil.png"))
    my_label = Label(top, image = my_image).pack()
    btn2 = Button(top, text = "close window", command = top.destroy).pack()

btn = Button(root, text = "Open second window", command = open).pack()

root.mainloop()