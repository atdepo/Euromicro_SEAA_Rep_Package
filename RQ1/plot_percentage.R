library(ggplot2)
library(dplyr)
library(viridis)  # Per la palette di colori per daltonici

# Caricare i dati dal CSV
data <- read.csv("/Users/broke31/Desktop/Euromicro2024/RQ1/dataset/not_well_eng_.csv")

selected_data <- data %>% select(ComplexContainerComprehension,
                                 ComplexLambdaExpression,
                                 LargeClass,
                                 LongBaseClassList,
                                 LongMessageChain,
                                 LongMethod,
                                 LongParameterList,
                                 LongScopeChaining,
                                 LongTernaryConditionalExpression,
                                 MultiplyNestedContainer)

# Calcola la somma di ciascuna colonna
column_sums <- sapply(selected_data, sum)

# Calcola il totale di tutte le somme per ottenere la base per il calcolo delle percentuali
total_sum <- sum(column_sums)

# Calcola le percentuali
percentages <- (column_sums / total_sum) * 100

# Crea un dataframe per il plotting con le percentuali
df_plot <- data.frame(Smell = names(percentages), Percentage = percentages)

# Ordina il dataframe in base alla percentuale
df_plot <- df_plot %>% arrange(Percentage)

# Crea un grafico a barre mostrando le percentuali
p <- ggplot(df_plot, aes(x = reorder(Smell, Percentage), y = Percentage, fill = Smell)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = sprintf("%.2f%%", Percentage)), vjust = -0.3, size = 5, fontface = "bold") +  # Increased text size
  scale_fill_viridis(discrete = TRUE) +  # Usa la palette di colori per daltonici
  theme_minimal() +
  labs(title = "",
       x = "",
       y = "") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, face = "bold", size = 15), 
        axis.text.y = element_text(face = "bold", size = 12), 
        axis.title.x = element_text(face = "bold", size = 20), 
        axis.title.y = element_text(face = "bold", size = 20), 
        plot.title = element_text(face = "bold", size = 22),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(color = "black"),
        legend.position = "none")  # Rimuovi la legenda

print(p)