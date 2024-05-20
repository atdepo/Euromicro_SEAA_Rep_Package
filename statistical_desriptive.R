#statistical descriptive

df <- read.csv("./splitted/over60/not_well_engineered.csv",header = T)

print(summary(df$Stars))
print(summary(df$Lines.of.Code))
print(summary(df$Commits))
