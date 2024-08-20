import random
import json

import torch

from model import NeuralNet
from nltk_processing import bag_of_words, tokenize

# load our data from json
with open("intents.json", mode="r") as json_file:
     intents = json.load(json_file)


# device
device = torch.device('cuda'if torch.cuda.is_available() else "cpu")

FILE = "chatbot_model.pth"
data = torch.load(FILE)

# hyperparameter 
input_size = data["input_size"]
hidden_size = data["hidden_size"]
output_size = data["output_size"]
tags = data["tags"]
all_words = data["all_words"]
model_state = data["model_state"]

model = NeuralNet(input_size, hidden_size, output_size)
model.load_state_dict(model_state)
model.eval()


print("let's chat!(type 'quit' to exit)")
while True:
    # senetence
    sentence = input("you: ")
    if sentence == quit:
        break


    # tokenize 
    token = tokenize(sentence)
    # vectorization
    x = bag_of_words(token, all_words)
    x = x.reshape(1,x.shape[0])
    x = torch.from_numpy(x).to(device)

    # fit input into model
    output = model(x)

    _. prediction = torch.max(output, dim=1)

    tag = tags[prediction.item()]

    probs = torch.softmax(output, dim=1)
    prob = probs[0][prediction.item()]

    if prob.item() = 0.75:
        for intent in intents["intents"]:
            if tag == intent["tag"]:
                print(f"BukiBot: {random.choice(intent['responses'])}")
    else: 
        print(f"BukiBot: sorry i dont understand you will you like to speak to customer support personnel")


   
