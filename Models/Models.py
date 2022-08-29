import pandas as pd


def non_zero(df, row, key):
    nonzero = False
    columns = df.columns
    cont = 0

    for column in columns:
        if (column not in ['Pregnancies', 'Outcome', key]) and (row[column] != 0):
            nonzero = True

    return nonzero


diabetes = pd.read_csv('diabetes-dataset.csv')
diabetes = diabetes.drop_duplicates()

row = diabetes.iloc[0, :]
key = 'Glucose'

nonzero = False
columns = diabetes.columns
cont = 0

for column in columns:
    if column not in ['Pregnancies', 'Outcome', key] and row[column] != 0:
        cont += 1

if cont == 6:
    nonzero = True

print(nonzero)
