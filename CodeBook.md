# Getting and Cleaning Data Course Project
This code book explains the transformation that is performed in the script run_analysis.R.

# Explanation of the script
1. Load dplyr library that's being used in the script
2. Download the raw data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzip the files
3. Read the feature and activity names from features.txt and activity_labels.txt.
4. Merge the training set data
  - Read the subject data from subject_train.txt and apply the variable name Subject
  - Read the activity id data from y_train.txt and apply the variable name ActivityId
  - Read the training data from X_train.txt and apply the variable names from feature names from step 3
  - Use cbind to merge the training data together
5. Merge the test set data
  - Read the subject data from subject_test.txt and apply the variable name Subject
  - Read the activity id data from y_test.txt and apply the variable name ActivityId
  - Read the training data from X_test.txt and apply the variable names from feature names from step 3
  - Use cbind to merge the test data together
6. Merge the training and test datasets together using rbind
7. Extract only the measurements on the mean and standard deviation for each measurement, note that this is only extracting mean and std variables, not meanFreq or gravityMean for example
8. Replace the ActvitiyId with actvitiy names
9. Clean up variable names by removing trailing dots, and replacing dots with underscore
10. Create a second, independent tidy data set with the average of each variable for each activity and each subject, and output it to a file called tidydata.txt

# Description of tidy data
Each row contains a single observation with the following variables (total of 68 variables):
* Subject - type numeric - unique identifier of the 30 volunteers that participated in the experiments
* Activity - type character - one of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) each person performed when the data was measured

For detailed description of the remaining variables (they all have the type numeric), please refer to features_info.txt in the raw data files:
* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z
* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z
* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z
* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z
* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z
* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z
* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z
* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z
* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z
* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z
* tBodyAccMag_mean
* tBodyAccMag_std
* tGravityAccMag_mean
* tGravityAccMag_std
* tBodyAccJerkMag_mean
* tBodyAccJerkMag_std
* tBodyGyroMag_mean
* tBodyGyroMag_std
* tBodyGyroJerkMag_mean
* tBodyGyroJerkMag_std
* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z
* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z
* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z
* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z
* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z
* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z
* fBodyAccMag_mean
* fBodyAccMag_std
* fBodyBodyAccJerkMag_mean
* fBodyBodyAccJerkMag_std
* fBodyBodyGyroMag_mean
* fBodyBodyGyroMag_std
* fBodyBodyGyroJerkMag_mean
* fBodyBodyGyroJerkMag_std