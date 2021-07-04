from tkinter import *

# Create a root window
root = Tk()

# Create a label widget
myLabel1 = Label(root, text = "Hello, World!")
myLabel2 = Label(root, text = "Hi again!")
myLabel3 = Label(root, text = "         ")

# Put them in the grid
# The positions are relative!
myLabel1.grid(row = 0, column = 0)
myLabel2.grid(row = 1, column = 5)
myLabel3.grid(row = 1, column = 1)

# Put the root into the loop
root.mainloop()