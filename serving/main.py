import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'
os.environ["TF_ENABLE_ONEDNN_OPTS"] = "0"

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import uvicorn
# tensorflow cpu versie
import tensorflow as tf
import numpy as np

# constants
MODEL_PATH = r"C:\Users\zardo\Desktop\energy_imbalance_forecasting\training\mnist_model.keras"

# Initialize FastAPI app
app = FastAPI(
    title="energy imbalance forecasting model API",
    description="template",
    version="1.0.0"
)

# CORS middleware configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # In production, replace with specific origins
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# load the model
model = tf.keras.models.load_model(MODEL_PATH)

# Pydantic models in plaats van type annotation zodat we de json result niet hoeven te deconstrueren
class HealthResponse(BaseModel):
    status: str
    message: str

class MNISTInput(BaseModel):
    pixels: list[list[float]]  # 28x28 array

    
# Root endpoint
@app.get("/")
async def root():
    """
    Root endpoint
    """
    return {
        "message": "Welcome to the API",
        "docs": "/docs"
    }

# Health check endpoint
@app.get("/health", response_model=HealthResponse)
async def health_check():
    """
    Health check endpoint
    """
    return {
        "status": "healthy",
        "message": "API is running"
    }


@app.post("/predict")
def predict(data: MNISTInput):
    x_input = tf.constant(np.array([data.pixels]), dtype=tf.float32)
    y_pred = tf.argmax(model(x_input), axis=1)
    return {"prediction": y_pred.numpy().tolist()}


# Run the application
if __name__ == "__main__":
    uvicorn.run(
        "main:app",
        host="0.0.0.0",
        port=8000,
        reload=True
    )
