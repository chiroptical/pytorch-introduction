import torch.nn as nn

input_size = mnist_vanilla[0][0].shape.numel()
hidden_sizes = [128, 64, 32]
num_classes = df["Label"].unique().shape[0]

model = nn.Sequential(
    nn.Flatten(),
    nn.Linear(input_size, hidden_sizes[0]),
    nn.ReLU(),
    nn.Linear(hidden_sizes[0], hidden_sizes[1]),
    nn.ReLU(),
    nn.Linear(hidden_sizes[1], hidden_sizes[2]),
    nn.ReLU(),
    nn.Linear(hidden_sizes[2], num_classes),
    nn.Softmax(dim=1),
)
