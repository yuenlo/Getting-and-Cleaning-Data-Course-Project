# Getting and Cleaning Data Course Project
This repo contains this README, the code book that describes the transformation of data, the R script and the output file of tidy data set.

# Executing the script
Run run_analysis.R

# Output
The script will output the file tidydata.txt.
You can view the file with the following code:
```
data <- read.table(<path to tidydata.txt>), header = TRUE)
View(data)
```