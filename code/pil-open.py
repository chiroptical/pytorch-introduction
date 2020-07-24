import numpy as np
from PIL import Image

img = Image.open("../data/mnist/0.png")
arr = np.array(img)

# (width, height)
print(arr.shape) # (28, 28)
print(arr.min()) # 0
print(arr.max()) # 255
