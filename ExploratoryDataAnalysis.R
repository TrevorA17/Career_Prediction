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

# 1. Measures of Frequency

## Categorical Data (Frequency Table)
career_freq <- table(AptitudeData$Career)
print("Career Frequency Table:")
print(career_freq)

# Proportion of each category
career_prop <- prop.table(career_freq)
print("Proportion of Career Categories:")
print(career_prop)

## Numeric Data (Frequency Distribution - Histogram)
hist(AptitudeData$Numerical_Aptitude, 
     main = "Histogram of Numerical Aptitude", 
     xlab = "Numerical Aptitude", 
     col = "blue", 
     border = "black")

# 2. Measures of Central Tendency

## Mean and Median
mean_value <- mean(AptitudeData$Numerical_Aptitude, na.rm = TRUE)
median_value <- median(AptitudeData$Numerical_Aptitude, na.rm = TRUE)

print(paste("Mean of Numerical Aptitude:", mean_value))
print(paste("Median of Numerical Aptitude:", median_value))

## Mode (Custom function)
get_mode <- function(x) {
  uniq_x <- unique(x)
  uniq_x[which.max(tabulate(match(x, uniq_x)))]
}
mode_value <- get_mode(AptitudeData$Numerical_Aptitude)
print(paste("Mode of Numerical Aptitude:", mode_value))

# 3. Measures of Distribution

## Range, Variance, and Standard Deviation
range_value <- range(AptitudeData$Numerical_Aptitude, na.rm = TRUE)
variance_value <- var(AptitudeData$Numerical_Aptitude, na.rm = TRUE)
sd_value <- sd(AptitudeData$Numerical_Aptitude, na.rm = TRUE)

print(paste("Range of Numerical Aptitude:", paste(range_value, collapse = " to ")))
print(paste("Variance of Numerical Aptitude:", variance_value))
print(paste("Standard Deviation of Numerical Aptitude:", sd_value))

## Skewness and Kurtosis (e1071 package)
install.packages("e1071")
library(e1071)

skew_value <- skewness(AptitudeData$Numerical_Aptitude, na.rm = TRUE)
kurtosis_value <- kurtosis(AptitudeData$Numerical_Aptitude, na.rm = TRUE)

print(paste("Skewness of Numerical Aptitude:", skew_value))
print(paste("Kurtosis of Numerical Aptitude:", kurtosis_value))

# 4. Measures of Relationship

## Correlation (for Numeric Data)
correlation_value <- cor(AptitudeData$Numerical_Aptitude, AptitudeData$Spatial_Aptitude, use = "complete.obs")
print(paste("Correlation between Numerical and Spatial Aptitude:", correlation_value))



