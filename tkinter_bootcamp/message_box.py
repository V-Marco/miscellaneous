from tkinter import *
from PIL import ImageTk, Image
from tkinter import messagebox

root = Tk()
root.title("Title")

def popup():
    response = messagebox.askokcancel("This is my popup.", "Hello, World!")
    if response == 1:
        Label(root, text = "You clicked yes!").pack()
    else:
        Label(root, text = "You clicked no!").pack()

Button(root, text = "Pop Up!", command = popup).pack()


root.mainloop()