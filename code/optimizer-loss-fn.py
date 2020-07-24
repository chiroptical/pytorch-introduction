import torch.nn as nn
import torch.optim as optim

optimizer = optim.Adam(
    lr=0.001,
    params=model.parameters()
)
loss_fn = nn.CrossEntropyLoss()
