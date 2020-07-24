num_epochs = 15

for epoch in range(num_epochs):
    model.train()
    for X, y in loader:
        # Size([32, 1]) -> Size([32])
        #  necessary for CrossEntropyLoss
        targets = y.squeeze(1)

        outputs = model(X)
        loss = loss_fn(outputs, targets)
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()

        predictions = outputs.clone().detach().argmax(dim=1)
