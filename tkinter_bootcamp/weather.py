from tkinter import *
from PIL import ImageTk, Image
import requests
import json

root = Tk()
root.title("Weather App")
root.geometry("400x50")

try:
    api_request = requests.get("__KEY__HERE__")
    api = json.loads(api_request.content)
except Exception as e:
    api = "Error..."

myLabel = Label(root, text = api[0])
myLabel.pack()


root.mainloop()