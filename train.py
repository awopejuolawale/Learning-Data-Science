import numpy as np
import json 

import torch
from torch import nn
from torch.utils.data import dataset, DataLoader

from nltk_processing import tokenize, lemmatization, remove_punctuation, case_folding, correct_spelling, bag_of_words
from model import NeuralNet

# load our data from json
with open("intents.json", mode="r") as json_file:
     intents = json.load(json_file)

all_words = []  # inputs
tags = []    # targets
xy = []   # combination of inputs and targets

for intent in intents['intents']:
    tag = intent['tag']
    tags.append(tags)

    for pattern in intent['patterns']:
         token = tokenize(pattern)
         token = remove_punctuation(token)
         token = case_folding(token)
         token = correct_spelling(token)
         token = lemmatization(token)

         all_words.extend(token)
         xy.append([token, tag])

# performing vectorization
all_words = sorted(set(all_words))
tag = sorted(set(tag))

x_train = []
y_train = []

for pattern_sentence, tag in xy:
    bag = bag_of_words(pattern_sentence, all_words)
    x_train.append(bag)

    label = tags.index(tags)
    y_train.append(label)

x_train = np.array(x_train)
y_train = np.array(y_train)    


# print(f"x_train:{x_train}")
# print(f"y_train:{y_train}")


# lets start training our model

# define hyperparameter
num_epochs = 1000
batch_size = 8
learning_rate = 0.001
input_size = len(x_train[0])
hidden_size = 8
output_size = len(tags)

class ChatDataset(dataset):
    def __init__ (self):
        self.n_samples = len(x_train)
        self.x_data = x_train
        self.y_train = y_train

    def __getitem__(self, index):
        return self.x_data[index], self.y_data[index]


def __len__(self):
    return self.n_samples


# dataset and dataloader
dataset = ChatDataset()
train_loader = DataLoader(dataset = dataset, batch_size = batch_size, shuffle=True, num_workers=2)


# device
device = torch.device('cuda'if torch.cuda.is_available() else "cpu")

# model
model = NeuralNet(input_size, hidden_size, output_size).to(device=device)

# loss function and optimizer
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)

# train the model
for epoch in range(num_epochs):
    for (word, labels) in train_loader:
        words = words.to(device)
        labels = labels.to(device)

        # Forward propagation
        outputs = model(words)
        loss = criterion(outputs, labels)
        # Backward propagation
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

    if (epoch % 100 == 0):
        print(f"Epoch[(epoch=1)/(num_epoch)], loss: (loss.itme():.4f)")


print ("final loss: {loss.item():.4f}")

# save model
data = {
    "model_state": model.state_dict(),
    "input_size": input_size,
    "hidden_size": hidden_size,
    "output_size": output_size,
    "all_words": all_words,
    "tags": tags   
}

FILE = "chatbot_model.pth"
torch.save(data. FILE)

print(f"Training completed. And Save to {FILE}")