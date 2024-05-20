# Caricare le librerie necessarie
library(readr)
library(dplyr)
library(tidyr)

data <- read_csv("/Users/broke31/Desktop/Euromicro2024/splitted/over60/well_engineered.csv")
# Verifica struttura del dataset
ind_vars <- c("Stars", "Commits", "Lines of Code","Community_Converted",
              "Continuous Integration_Converted","Documentation_Converted",
              "History_Converted","Issues_Converted","License_Converted",
              "Unit Testing_Converted")

dep_vars <- c("Normalized_ComplexContainerComprehension", 
              "Normalized_ComplexLambdaExpression",
              "Normalized_LargeClass", 
              "Normalized_LongBaseClassList", 
              "Normalized_LongMessageChain", 
              "Normalized_LongMethod", 
              "Normalized_LongParameterList", 
              "Normalized_LongScopeChaining", 
              "Normalized_LongTernaryConditionalExpression", 
              "Normalized_MultiplyNestedContainer")

results_spearman <- data.frame(Dependent = character(),
                               Independent = character(),
                               Correlation = numeric(),
                               P_Value = numeric(),
                               Significance = character(),
                               stringsAsFactors = FALSE)

results_kendall <- data.frame(Dependent = character(),
                              Independent = character(),
                              Correlation = numeric(),
                              P_Value = numeric(),
                              Significance = character(),
                              stringsAsFactors = FALSE)

# Funzione per aggiungere gli asterischi di significatività
significance <- function(correlation) {
  abs_correlation <- abs(correlation)
  if (is.na(abs_correlation)) {
    return("NA")
  } else if (abs_correlation >= 0.5) {
    return("***")
  } else if (abs_correlation >= 0.3) {
    return("**")
  } else if (abs_correlation >= 0.1) {
    return("*")
  } else {
    return("")
  }
}

# Loop attraverso tutte le combinazioni di variabili dipendenti e indipendenti
for (dep_var in dep_vars) {
  for (ind_var in ind_vars) {
    spearman_test <- cor.test(data[[dep_var]], data[[ind_var]], method = "spearman")
    kendall_test <- cor.test(data[[dep_var]], data[[ind_var]], method = "kendall")
    
    # Aggiungere i risultati al dataframe di Spearman
    results_spearman <- rbind(results_spearman, data.frame(Dependent = dep_var,
                                                           Independent = ind_var,
                                                           Correlation = spearman_test$estimate,
                                                           P_Value = spearman_test$p.value,
                                                           Significance = significance(spearman_test$estimate)))
    
    # Aggiungere i risultati al dataframe di Kendall
    results_kendall <- rbind(results_kendall, data.frame(Dependent = dep_var,
                                                         Independent = ind_var,
                                                         Correlation = kendall_test$estimate,
                                                         P_Value = kendall_test$p.value,
                                                         Significance = significance(kendall_test$estimate)))
  }
}

# Visualizzare i risultati di Spearman
print("Risultati del test di Spearman:")
print(results_spearman)
#write.table(results_spearman, "/Users/broke31/Desktop/Euromicro2024/RQ2/not_well_spearman.csv", row.names = FALSE)

# Visualizzare i risultati di Kendall
print("Risultati del test di Kendall:")
print(results_kendall)
write.table(results_kendall, "/Users/broke31/Desktop/Euromicro2024/RQ2/Large/not_well_kendall.csv", row.names = FALSE, sep = ",")