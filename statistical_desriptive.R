#statistical descriptive


df <- read.csv("/Users/broke31/Desktop/Euromicro2024/splitted/over60/not_well_engineered.csv",header = T)

print(summary(df$Stars))
print(summary(df$Lines.of.Code))
print(summary(df$Commits))

