import pandas as pd
from sklearn.preprocessing import MinMaxScaler

# Carica il dataset
file_path = 'dataset_niche_and_smells_without_not_smells.csv'
data = pd.read_csv(file_path)

# Definisci le colonne da normalizzare
columns_to_normalize = [
    'ComplexContainerComprehension', 'ComplexLambdaExpression', 'LargeClass',
    'LongBaseClassList', 'LongMessageChain', 'LongMethod', 'LongParameterList',
    'LongScopeChaining', 'LongTernaryConditionalExpression', 'MultiplyNestedContainer'
]

# Applica Min-Max Scaling
scaler = MinMaxScaler(feature_range=(0, 1))
data_normalized = scaler.fit_transform(data[columns_to_normalize])

# Converti i dati normalizzati in un DataFrame e rinomina le colonne
data_normalized_df = pd.DataFrame(data_normalized, columns=[f'Normalized_{col}' for col in columns_to_normalize])

# Unisci il DataFrame normalizzato con il dataset originale
data_final = pd.concat([data, data_normalized_df], axis=1)

# Salva il dataset modificato in un nuovo file CSV
output_file_path = 'normalized_dataset.csv'
data_final.to_csv(output_file_path, index=False)

print("Normalized dataset saved to", output_file_path)
