import gradio as gr
import tensorflow as tf
from tensorflow.keras.applications import imagenet_utils
from tensorflow.keras.utils import img_to_array
from tensorflow.keras.models import load_model
import numpy as np





def Prediction_VGG16(image):
    
    #Prepare image
    IMG_SIZE = 224
    image = img_to_array(image)
    image = image*1.0/255.0
    img_prepared = image.reshape((-1,IMG_SIZE,IMG_SIZE,3))
    

    #Load model vgg6 package
    path = "model_vgg16.h5"
    my_model =load_model(path)



    #Prediction
    classes = ["Brain Tumor","Healthy"]
    prediction = my_model.predict(img_prepared)[0]
    prediction = prediction.tolist()


    return {k:v for k,v in zip(classes,prediction)}




demo = gr.Interface(Prediction_VGG16, gr.inputs.Image(shape=(224,224)),gr.Label(num_top_classes=2))

demo.launch(server_name="0.0.0.0")