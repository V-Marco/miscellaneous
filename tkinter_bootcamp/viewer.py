from tkinter import *
from PIL import ImageTk, Image

root = Tk()
root.title("This is an Images app!")

my_img = ImageTk.PhotoImage(Image.open("images/pencil.png"))
my_img2 = ImageTk.PhotoImage(Image.open("images/pencil2.png"))

def forward(image_number):
    global my_label
    global button_forward
    global button_back

    # Delete the currently displayed image
    my_label.grid_forget()

    my_label = Label(image = image_list[image_number - 1])
    button_forward = Button(root, text = ">>", command = lambda: forward(image_number + 1))
    button_back = Button(root, text = "<<", command = lambda: back(image_number - 1))

    if image_number == 2:
        button_forward = Button(root, text = ">>", state = DISABLED)

    button_back.grid(row = 1, column = 0)
    button_forward.grid(row = 1, column = 2)

    my_label.grid(row = 0, column = 0, columnspan = 3)

    status = Label(root, text = "Image " + str(image_number) + " of " + str(len(image_list)), bd = 1, relief = SUNKEN, anchor = E)
    status.grid(row = 2, column = 0, columnspan = 3, sticky = W + E)

def back(image_number):
    global my_label
    global button_forward
    global button_back

    my_label.grid_forget()

    my_label = Label(image = image_list[image_number - 1])
    button_forward = Button(root, text = ">>", command = lambda: forward(image_number + 1))
    button_back = Button(root, text = "<<", command = lambda: back(image_number - 1))

    if image_number == 1:
        button_back = Button(root, text = "<<", state = DISABLED)

    button_back.grid(row = 1, column = 0)
    button_forward.grid(row = 1, column = 2)

    my_label.grid(row = 0, column = 0, columnspan = 3)

    status = Label(root, text = "Image " + str(image_number) + " of " + str(len(image_list)), bd = 1, relief = SUNKEN, anchor = E)
    status.grid(row = 2, column = 0, columnspan = 3, sticky = W + E)


image_list = [my_img, my_img2]

status = Label(root, text = "Image 1 of " + str(len(image_list)), bd = 1, relief = SUNKEN, anchor = E)
status.grid(row = 2, column = 0, columnspan = 3, sticky = W + E)

my_label = Label(image = my_img)
my_label.grid(row = 0, column = 0, columnspan = 3)

button_back = Button(root, text = "<<", command = back, state = DISABLED)
button_exit = Button(root, text = "Exit", command = root.quit)
button_forward = Button(root, text = ">>", command = lambda: forward(2))

button_back.grid(row = 1, column = 0)
button_exit.grid(row = 1, column = 1)
button_forward.grid(row = 1, column = 2, pady = 10)

root.mainloop()