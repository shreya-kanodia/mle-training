import pandas as pd
from housing_price_shreya_kanodia import train as t

HOUSING_PATH='data/processed_dataset/housing_train.csv'

def test_load_dataset():
    obtained=t.load_dataset(HOUSING_PATH)
    assert type(obtained) is pd.DataFrame

def test_X_y_creation():
    X, y = t.X_y_creation(pd.read_csv('data/processed_dataset/housing_train.csv'))
    assert len(X) == len(y)
    assert "median_house_value" not in X.columns
    assert not X.isna().sum().sum()
    assert len(y.shape) == 1
