# Loads dplyr library
library(dplyr)

# Downloads and unzips data files
url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest = "projectfiles.zip"

if(!file.exists(dest))
{
    download.file(url, destfile=dest, method="curl")
    unzip(dest)
}

# Reads in feature and activity names that are common to training and test datasets
features = read.table("./UCI HAR Dataset/features.txt", colClasses = c("numeric","character"))
activities = read.table("./UCI HAR Dataset/activity_labels.txt", colClasses = c("numeric","character"), col.names = c("ActivityId", "Activity"))

# Merges data for training set
subject = read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = 'numeric', col.names = "Subject")
y = read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = 'numeric', col.names = "ActivityId")
x = read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = 'numeric', col.names = features$V2)
training = subject %>% cbind(y) %>% cbind(x)

# Merges data for test set
subject = read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = 'numeric', col.names = "Subject")
y = read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = 'numeric', col.names = "ActivityId")
x = read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = 'numeric', col.names = features$V2)
test = subject %>% cbind(y) %>% cbind(x)

# Merges the training and the test sets to create one data set
merged = rbind(training, test)

# Extracts only the measurements on the mean and standard deviation for each measurement
# Note: taking mean and std only, not meanFreq or gravityMean for example
meanOrStd = grep("^Subject$|^ActivityId$|\\.mean\\.|\\.std\\.", colnames(merged))
merged = merged[,meanOrStd]

# Uses descriptive activity names to name the activities in the data set
merged = merge(merged, activities, by.x="ActivityId", by.y="ActivityId")
merged$ActivityId <- NULL

# Appropriately labels the data set with descriptive variable names
# Remove trailing dots
colnames(merged) = gsub("\\.+$", "", colnames(merged))
# Replace dots with underscore
colnames(merged) = gsub("\\.+", "_", colnames(merged))

# Creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy = merged %>% group_by(Subject, Activity) %>% summarize_all(mean)
# Ouput to file
write.table(tidy, "tidydata.txt", row.names = FALSE)