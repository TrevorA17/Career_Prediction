# Load the dataset with specified column classes
AptitudeData <- read.csv("data/Data_final.csv", colClasses = c(
  O_score = "numeric",  # Objective Score
  C_score = "numeric",  # Cognitive Score
  E_score = "numeric",  # Emotional Score
  A_score = "numeric",  # Analytical Score
  N_score = "numeric",  # Numerical Score
  Numerical_Aptitude = "numeric",  # Numerical Aptitude
  Spatial_Aptitude = "numeric",  # Spatial Aptitude
  Perceptual_Aptitude = "numeric",  # Perceptual Aptitude
  Abstract_Reasoning = "numeric",  # Abstract Reasoning
  Verbal_Reasoning = "numeric",  # Verbal Reasoning
  Career = "factor"  # Career (target variable)
))

# Display structure to verify data types
str(AptitudeData)

# Display first few rows to ensure data is loaded correctly
head(AptitudeData)

# View the dataset in a spreadsheet-like interface (optional)
View(AptitudeData)

# Check for missing values in the entire dataset
missing_values <- sum(is.na(AptitudeData))

# Print the total number of missing values in the dataset
cat("Total missing values in the dataset: ", missing_values, "\n")

# Check for missing values in each column
missing_by_column <- colSums(is.na(AptitudeData))

# Print the number of missing values per column
cat("Missing values per column:\n")
print(missing_by_column)

# Visualize missing data using the 'naniar' package (optional)
# install.packages("naniar")
library(naniar)

# Visualize missing data in the dataset
gg_miss_var(AptitudeData)

# Another way to visualize missing data using 'VIM' package
# install.packages("VIM")
library(VIM)

# Visualize missing data pattern
aggr(AptitudeData, col = c("navy", "yellow"), numbers = TRUE, 
     sortVars = TRUE, labels = names(AptitudeData), cex.axis = 0.7, 
     main = "Missing Data Pattern")
