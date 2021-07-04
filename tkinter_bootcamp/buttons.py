from tkinter import *

root = Tk()

def myClick():
    myLabel = Label(root, text = "Look! I clicked a button!")
    myLabel.pack()

# state = DISABLED
# padx = 50, pady = 50
myButton = Button(root, text = "Click me!", command = myClick, fg = "blue").pack()

root.mainloop()