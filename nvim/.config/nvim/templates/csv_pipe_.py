import pandas as pd
import matplotlib.pyplot as plt


def load_data(filepath: str) -> pd.DataFrame:
    return pd.read_csv(filepath)


def process_data(df: pd.DataFrame) -> pd.DataFrame:
    return df


def plot_results(df: pd.DataFrame, x_col: str, y_col: str):
    fig, ax = plt.subplots()
    ax.plot(df[x_col], df[y_col])
    plt.show()


if __name__ == '__main__':
    df = load_data('data.csv')
    df = process_data('<>')
    plot_results(df, '<>', '<>'),
    ]],

