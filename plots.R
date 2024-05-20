library(ggplot2)
library(dplyr)
library(viridis)  # For color palettes

# Load the data from the CSV files
data1 <- read.csv("./RQ1/dataset/well_eng_.csv")
data2 <- read.csv("./RQ1/dataset/not_well_eng_.csv")

# Select the relevant columns from both datasets
selected_data1 <- data1 %>% select(ComplexContainerComprehension,
                                   ComplexLambdaExpression,
                                   LargeClass,
                                   LongBaseClassList,
                                   LongMessageChain,
                                   LongMethod,
                                   LongParameterList,
                                   LongScopeChaining,
                                   LongTernaryConditionalExpression,
                                   MultiplyNestedContainer)

selected_data2 <- data2 %>% select(ComplexContainerComprehension,
                                   ComplexLambdaExpression,
                                   LargeClass,
                                   LongBaseClassList,
                                   LongMessageChain,
                                   LongMethod,
                                   LongParameterList,
                                   LongScopeChaining,
                                   LongTernaryConditionalExpression,
                                   MultiplyNestedContainer)

# Calculate the sum of each column for both datasets
column_sums1 <- sapply(selected_data1, sum)
column_sums2 <- sapply(selected_data2, sum)

# Calculate the total sums for each dataset to get the base for percentage calculation
total_sum1 <- sum(column_sums1)
total_sum2 <- sum(column_sums2)

# Calculate the percentages for each dataset
percentages1 <- (column_sums1 / total_sum1) * 100
percentages2 <- (column_sums2 / total_sum2) * 100

# Create dataframes for plotting
df_plot1 <- data.frame(Smell = names(percentages1), Percentage = percentages1, Dataset = "Well Engineered")
df_plot2 <- data.frame(Smell = names(percentages2), Percentage = percentages2, Dataset = "Not Well Engineered")

# Combine the dataframes for plotting
df_plot <- rbind(df_plot1, df_plot2)

# Create a grouped barplot showing the percentages for both datasets
p <- ggplot(df_plot, aes(x = reorder(Smell, -Percentage), y = Percentage, fill = Dataset)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = sprintf("%.2f%%", Percentage)), position = position_dodge(width = 0.9), vjust = -0.3, size = 5, fontface = "bold") +
  scale_fill_viridis(discrete = TRUE) +  # Use color palette for colorblind
  theme_minimal() +
  labs(#title = "Comparison of Feature Percentages Between Two Datasets",
       x = "",
       y = "Percentage") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, face = "bold", size = 12),
        axis.text.y = element_text(face = "bold", size = 12),
        axis.title.x = element_text(face = "bold", size = 15),
        axis.title.y = element_text(face = "bold", size = 15),
        plot.title = element_text(face = "bold", size = 18),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank(),
        axis.line = element_line(color = "black"),
        legend.position = "top")  # Position the legend at the top

print(p)
