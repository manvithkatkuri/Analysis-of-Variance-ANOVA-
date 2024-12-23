# ANOVA Analysis for Counties in Midwestern States

# Load required libraries
library(rio)
library(car)

# Load the dataset
county_dataset <- rio::import("6304 Module 9 Assignment Data.xlsx")

# Select relevant variables
analysis_data <- county_dataset[, c("state", "popdensity", "density.category", "percollege", "inmetro")]

# Sampling
set.seed(99718118)  # Replace with your U number
sampled_dfs <- lapply(unique(analysis_data$state), function(state_val) {
  state_data <- subset(analysis_data, state == state_val)
  sample_size <- min(50, nrow(state_data))
  state_data[sample(1:nrow(state_data), sample_size), ]
})
sample_data <- do.call(rbind, sampled_dfs)

# Convert variables to factors
sample_data$state <- as.factor(sample_data$state)
sample_data$density.category <- as.factor(sample_data$density.category)
sample_data$inmetro <- as.factor(sample_data$inmetro)

# Descriptive Analysis
cat("Structure of the sampled dataset:\n")
str(sample_data)

cat("\nCount of entries by state:\n")
print(table(sample_data$state))

# Levene's Test
cat("\nLevene's Test for Homogeneity of Variance:\n")
levene_state <- leveneTest(percollege ~ state, data = sample_data)
print(levene_state)

levene_density <- leveneTest(percollege ~ density.category, data = sample_data)
print(levene_density)

# One-Way ANOVA for 'state'
cat("\nOne-Way ANOVA for 'state':\n")
county_out_state <- aov(percollege ~ state, data = sample_data)
summary(county_out_state)

# Tukey HSD for 'state'
cat("\nTukey HSD for 'state':\n")
tukey_state <- TukeyHSD(county_out_state)
print(tukey_state)
plot(tukey_state, las = 2)

# One-Way ANOVA for 'density.category'
cat("\nOne-Way ANOVA for 'density.category':\n")
county_out_density <- aov(percollege ~ density.category, data = sample_data)
summary(county_out_density)

# Tukey HSD for 'density.category'
cat("\nTukey HSD for 'density.category':\n")
tukey_density <- TukeyHSD(county_out_density)
print(tukey_density)
plot(tukey_density, las = 2)

# Two-Way ANOVA for 'state' and 'density.category'
cat("\nTwo-Way ANOVA for 'state' and 'density.category':\n")
data_out_two_way <- aov(percollege ~ state + density.category, data = sample_data)
summary(data_out_two_way)

# Tukey HSD for Two-Way ANOVA
cat("\nTukey HSD for Two-Way ANOVA:\n")
tukey_two_way <- TukeyHSD(data_out_two_way)
print(tukey_two_way)
par(mfrow = c(1, 2))
plot(tukey_two_way, las = 2, cex.axis = 0.6)
