from tkinter import *
from PIL import Image, ImageTk

root = Tk()
root.title("Title")
root.geometry("400x400")

options = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

clicked = StringVar()
clicked.set(options[0])
drop = OptionMenu(root, clicked, *options).pack()

def show():
    myLabel = Label(root, text = clicked.get()).pack()

myButton = Button(root, text = "Show selection", command = show).pack()

root.mainloop()