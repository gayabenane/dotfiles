import pandas as pd
import matplotlib.pyplot as plt


def load_data(filepath: str) -> pd.DataFrame:
    return pd.read_csv(filepath)


if __name__ == "__main__":
    # Node 1
    df = load_data("data.csv")
    # Nodes 2 and 3
    plot_results(df, "x_col", "y_col")
