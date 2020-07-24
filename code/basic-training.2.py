for epoch in range(10):
    for x_i, y_i in zip(x, y):
        y_hat = model(x_i)
        output = loss(y_hat, y_i)

        output.backward()

        w.data = w.data - 0.001 * w.grad.data
        w.grad.data.zero_()

print(w)
