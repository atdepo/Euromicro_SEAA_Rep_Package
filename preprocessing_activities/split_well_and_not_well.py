import pandas as pd

file_path = '/Users/broke31/Desktop/Euromicro2024/percentile/Lines_of_Code_Above_60_Percentile.csv'
data = pd.read_csv(file_path)
well_engineered = data[data['Engineered ML Project'] == 'Y']
not_well_engineered = data[data['Engineered ML Project'] == 'N']
well_engineered.to_csv('/Users/broke31/Desktop/Euromicro2024/splitted/over60/well_engineered.csv', index=False)
not_well_engineered.to_csv('/Users/broke31/Desktop/Euromicro2024/splitted/over60/not_well_engineered.csv', index=False)

print("Files saved successfully.")