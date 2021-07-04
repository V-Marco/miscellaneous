from tkinter import *
from PIL import ImageTk, Image
from tkinter import filedialog

root = Tk()
root.title("Title")

def open():
    global my_image
    root.filename = filedialog.askopenfilename(initialdir = "./", title = "Select a File", 
                                            filetypes = [('png files', '*.png'), ('all files', '*.*')])

    mylabel = Label(root, text = root.filename).pack()
    my_image = ImageTk.PhotoImage(Image.open(root.filename))
    my_image_label = Label(root, image = my_image)
    my_image_label.pack()

my_button = Button(root, text = "Open file", command = open).pack()

root.mainloop()