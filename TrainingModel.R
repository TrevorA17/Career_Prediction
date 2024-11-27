# Load necessary libraries
install.packages(c("caret", "boot"))
library(caret)
library(boot)

# Data Splitting (Train-Test Split)
set.seed(123)  # Set seed for reproducibility
splitIndex <- createDataPartition(AptitudeData$Career, p = 0.7, list = FALSE)
train_data <- AptitudeData[splitIndex, ]
test_data <- AptitudeData[-splitIndex, ]

# Check the size of train and test data
cat("Training data size: ", nrow(train_data), "\n")
cat("Testing data size: ", nrow(test_data), "\n")

# Bootstrapping
# Set the number of bootstrap samples
set.seed(123)
bootstrap_samples <- boot(data = train_data, statistic = function(data, indices) {
  sample_data <- data[indices, ]  # Create bootstrap sample
  mean(sample_data$Numerical_Aptitude)  # Example statistic: mean of Numerical_Aptitude
}, R = 1000)  # Number of bootstrap samples

# Print bootstrap results
cat("Bootstrap mean estimate: ", bootstrap_samples$t0, "\n")
cat("Bootstrap standard error: ", sd(bootstrap_samples$t), "\n")

# Load necessary libraries
library(caret)

# Set seed for reproducibility
set.seed(123)

# Ensure Career is a factor (for stratified splitting)
AptitudeData$Career <- as.factor(AptitudeData$Career)

# Split the data: 70% for training and 30% for testing
splitIndex <- createDataPartition(AptitudeData$Career, p = 0.8, list = FALSE)

# Create training and testing sets
train_data <- AptitudeData[splitIndex, ]
test_data <- AptitudeData[-splitIndex, ]

# Check the size of train and test data
cat("Training data size: ", nrow(train_data), "\n")
cat("Testing data size: ", nrow(test_data), "\n")

# Make sure there's data in both the train and test sets
if(nrow(test_data) == 0) {
  cat("Test data is empty! Adjust the partition size.\n")
} else {
  cat("Test data contains", nrow(test_data), "rows.\n")
}

# Load necessary libraries
library(caret)

# Set seed for reproducibility
set.seed(123)

# Check the distribution of the 'Career' variable
cat("Class distribution:\n")
print(table(AptitudeData$Career))

# Ensure Career is a factor (for stratified sampling)
AptitudeData$Career <- as.factor(AptitudeData$Career)

# Define cross-validation control with stratified sampling
cv_control <- trainControl(
  method = "cv",           # Cross-validation
  number = 10,             # 10-fold cross-validation
  sampling = "smote",      # Use SMOTE for balancing the class distribution
  savePredictions = "final"  # Save predictions for final analysis
)

# Train a random forest model (you can change this to other models if necessary)
cv_model <- train(Career ~ ., data = AptitudeData, method = "rf", trControl = cv_control)

# Print the cross-validation results
print(cv_model)

# Check the accuracy of the model from the cross-validation
cat("Cross-validation accuracy: ", mean(cv_model$results$Accuracy), "\n")

