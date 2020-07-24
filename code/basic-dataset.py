from torch.utils.data import Dataset


class Example(Dataset):
    def __init__(self, df):
        self.df = df

    def __len__(self):
        return self.df.shape[0]

    def __getitem__(self, idx):
        row = self.df.iloc[idx]
        image_name = row["Image"]
        label = row["Label"]
        return image_name, label
