import torch
import random

x = [i for i in range(10)]
y = [w_true * i + random.uniform(-2, 2) for i in x]

w = torch.autograd.Variable(torch.Tensor([1.0]), requires_grad=True)


def module(x):
    return x * w


def loss(y_hat, y):
    return (y_hat - y) ** 2


for epoch in range(10):
    for x_i, y_i in zip(x, y):
        y_hat = model(x_i)
        output = loss(y_hat, y_i)

        output.backward()

        w.data = w.data - 0.001 * w.grad.data
        w.grad.data.zero_()

    print(f"Progress: {epoch} {o}")

print(w)
