import tkinter as tk
from tkinter import filedialog
from tkinter import messagebox
from PIL import Image, ImageTk
import numpy as np
import tensorflow as tf

model = tf.keras.load_model('zain_model.h5')

root = tk.Tk()
root.title('MRI Dataset')


def classify_image():
    file_path = filedialog.askopenfilename(filetypes=[("Image files","*.jpg *,jpeg")])
    if file_path:
        image = Image.open(file_path).convert("L").resize((28,28))
        image_array = np.array(image) /255.0
        image_array = image_array.reshape(784)
        prediction = model.predict(np.array([image_array]))
        predicted_digit = np.argmax(prediction)


        image_label.config(image=ImageTk.PhotoImage(image))
        result_label.config(text=f'Predicted Digit:{predicted_digit}')

open_button = tk.Button(root, test="Open Image", command=classify_image)
image_label = tk.Label(root)
result_label = tk.Label(root, test="Predicted Digit:  ")

open_button.pack(pady=10)
image_label.pack()
result_label.pack()


root.mainloop()