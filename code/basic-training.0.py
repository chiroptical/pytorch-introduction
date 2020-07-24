import torch
import random

x = [i for i in range(10)]
y = [2.0 * i + random.uniform(-2, 2)
        for i in x]

w = torch.autograd.Variable(
    torch.Tensor([1.0]),
    requires_grad=True
)
