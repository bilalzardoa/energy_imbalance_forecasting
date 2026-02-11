import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
os.environ["TF_ENABLE_ONEDNN_OPTS"] = "0"

import requests
import numpy as np

from tensorflow.keras.datasets import mnist

# Laad MNIST test set
(_, _), (X_test, y_test) = mnist.load_data()
image = X_test[0] / 255.0  # normalize
pixels = image.tolist()

response = requests.post("http://127.0.0.1:8000/predict", json={"pixels": pixels})
print(response.json())
