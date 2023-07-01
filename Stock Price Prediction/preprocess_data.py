import pandas as pd
from sklearn.preprocessing import MinMaxScaler


def normalize_data(data):
    """
    Normalize the data values using MinMaxScaler from sklearn.
    
    Parameters:
    - data: a DataFrame with columns ['index','Open','Close','Volume']
    
    Returns:
    - a DataFrame with normalized values for all columns except index
    """
    scaler = MinMaxScaler()
    numerical_cols = ['Open', 'Close', 'Volume']
    data[numerical_cols] = scaler.fit_transform(data[numerical_cols])
    return data


def remove_columns(data):
    """
    Remove unnecessary columns from the data.
    
    Parameters:
    - data: a DataFrame with columns ['Date','Open','High','Low','Close','Volume']
    
    Returns:
    - a DataFrame with columns ['index','Open','Close','Volume']
    """
    items = []
    open_prices = []
    close_prices = []
    volumes = []

    for i, row in data.iterrows():
        items.append(i)
        open_prices.append(row['Open'])
        close_prices.append(row['Close'])
        volumes.append(row['Volume'])

    stocks = pd.DataFrame({
        'Item': items,
        'Open': open_prices,
        'Close': pd.to_numeric(close_prices),
        'Volume': pd.to_numeric(volumes)
    })

    return stocks