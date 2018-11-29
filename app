import pandas as pd
import numpy as np
from fredapi import Fred

fred = Fred(api_key=API_Key)

one_m = fred.get_series('USD1MTD156N', observation_start='2018-01-01')
two_m = fred.get_series('USD2MTD156N', observation_start='2018-01-01')
three_m = fred.get_series('USD3MTD156N', observation_start='2018-01-01')
six_m = fred.get_series('USD6MTD156N', observation_start='2018-01-01')
twelve_m = fred.get_series('USD12MD156N', observation_start='2018-01-01')

df = pd.concat([one_m, two_m, three_m, six_m, twelve_m], axis=1).reset_index()
df.columns = ['Date', 'One Month', 'Two Month', 'Three Month', 'Six Month', 'Twelve Month']

#clean out the NA's if any

df.dropna(inplace=True)

#have it create a csv file on desktop

df.to_csv('libor_data.csv')
