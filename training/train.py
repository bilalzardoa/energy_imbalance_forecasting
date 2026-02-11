import numpy as np
import tensorflow as tf

(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()

x_train = x_train / 255.0
x_test = x_test / 255.0

def get_model():
    # Functional API is more flexible than Sequential
    inputs = tf.keras.Input(shape=(28, 28), name="mnist_input")
    x = tf.keras.layers.Dense(32, activation='relu')(inputs)
    x = tf.keras.layers.Dense(64, activation='relu')(x)
    x = tf.keras.layers.Flatten()(x)
    outputs = tf.keras.layers.Dense(10, activation='softmax', name="predictions")(x)

    model = tf.keras.Model(inputs=inputs, outputs=outputs, name="mnist_dense_model")

    model.compile(
      optimizer=tf.keras.optimizers.Adam(learning_rate=1e-4),
      loss='sparse_categorical_crossentropy',
      metrics=['accuracy']
    )

    history = model.fit(
        x_train, y_train,
        epochs=5,
        batch_size=32
    )
    return model


if __name__ == '__main__':
    print(tf.__version__)

    model = get_model()    
    model.save('mnist_model.keras')
