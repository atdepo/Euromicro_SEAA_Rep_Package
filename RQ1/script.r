library(ggplot2)
library(dplyr)

# Leggi i dati dal file CSV
data <- read.csv("/Users/broke31/Downloads/dataset_niche_and_smells_without_not_smells.csv")
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

# Crea un dataframe per il plotting
df_plot <- data.frame(Smell = names(column_sums), Count = column_sums)

# Ordina il dataframe in base alla conta
df_plot <- df_plot %>% arrange(Count)

# Crea un grafico a barre
p <- ggplot(df_plot, aes(x = reorder(Smell, Count), y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = Count), vjust = -0.3, size = 3.5, fontface = "bold") +
  theme_minimal() +
  labs(title = "",
       x = "",
       y = "") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"), 
        axis.text.y = element_text(face = "bold"), 
        axis.title.x = element_text(face = "bold"), 
        axis.title.y = element_text(face = "bold"), 
        plot.title = element_text(face = "bold"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), 
        panel.background = element_blank(), 
        axis.line = element_line(color = "black")) 


print(p)

