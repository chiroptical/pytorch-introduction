from torch.utils.data import DataLoader
import pandas as pd

input_df = pd.read_csv("../data/mnist.csv")

example = Example(input_df)

loader = torch.utils.data.DataLoader(
    example, batch_size=4, num_workers=4, shuffle=False
)

for X, y in loader:
    # Do something with X and y
    break
