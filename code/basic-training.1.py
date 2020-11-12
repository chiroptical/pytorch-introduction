def model(x):
    return x * w


def loss(y_hat, y):
    return ((y_hat - y) ** 2) / 2


y_hat = model(x[0])
output = loss(y_hat, y[0])
