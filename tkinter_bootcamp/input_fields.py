from tkinter import *

root = Tk()

e = Entry(root, width = 50, bg = 'blue', fg = 'white', borderwidth = 5)
e.pack()
# Index: 0 box
# Put default text inside
e.insert(0, "Enter your name")

def myClick():
    myLabel = Label(root, text = "Hello, " + e.get())
    myLabel.pack()

# state = DISABLED
# padx = 50, pady = 50
myButton = Button(root, text = "Enter Your Name", command = myClick, fg = "blue").pack()

root.mainloop()