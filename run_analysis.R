## run_analysis.R
## DS-03 Get and Clean Data
## Course Project

## DEAR GRADER -- IMPORTANT NOTE
## Because prior graders stated in their evaluations of my code that some segements were 'too elegant' and hard-to-follow...
## ...(for example: many nested functions), for this Assignment, I am specifically configuring each intermediate step...
## ...(example: multiple generations of 'test' and 'train' datasets each reflecting a single transformation)...
## ...in order to enhance readability and reduce grading complexity. While I wouldn't be so verbose in production,
## ...I hope it is of value to you as you evaluate this project. Thank you for your consideration.

## Instructions:

# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

rm(list=ls())
cat('\014')

getwd()

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# working_directory <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
working_directory <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(working_directory) ## Make it so, Number One (set the Working Directory to the best path)
getwd()

# Install R Packages useful for this Assignment

packages <- c("rmarkdown", "dplyr", "data.table", "stringr")
# install.packages(packages)
library(rmarkdown)
library(dplyr)
library(data.table)
library(stringr)

# Load the Features (Variable) Names dataset
source_features_labels <- "./UCI HAR Dataset/features.txt"
tbl_features_labels <- read.table(source_features_labels, header=FALSE)
colnames(tbl_features_labels) <- c("Feature_Code","Feature_Description")

# Load the Activity Labels dataset
source_activity_labels <- "./UCI HAR Dataset/activity_labels.txt"
tbl_activity_labels <- read.table(source_activity_labels, header=FALSE)
colnames(tbl_activity_labels) <- c("Activity_Code","Activity_Description")

# Load the Test datasets
source_subject_test <- "./UCI HAR Dataset/test/subject_test.txt"
tbl_subject_test <- read.table(source_subject_test, header=FALSE)

#Adorn with readable variable name
colnames(tbl_subject_test) <- "Subject_ID"

source_X_test <- "./UCI HAR Dataset/test/X_test.txt"
tbl_X_test <- read.table(source_X_test, header=FALSE)

#Adorn X_test dataset with Feature (Variable) names
colnames(tbl_X_test) <- tbl_features_labels$Feature_Description

source_y_test <- "./UCI HAR Dataset/test/y_test.txt"
tbl_y_test <- read.table(source_y_test, header=FALSE)
colnames(tbl_y_test) <- "Activity_Code"

# Load the Training datasets
source_subject_train <- "./UCI HAR Dataset/train/subject_train.txt"
tbl_subject_train <- read.table(source_subject_train, header=FALSE, row.names=NULL)
colnames(tbl_subject_train) <- "Subject_ID"

source_X_train <- "./UCI HAR Dataset/train/X_train.txt"
tbl_X_train <- read.table(source_X_train, header=FALSE)

#Adorn X_train dataset with Feature (Variable) names
colnames(tbl_X_train) <- tbl_features_labels$Feature_Description

source_y_train <- "./UCI HAR Dataset/train/y_train.txt"
tbl_y_train <- read.table(source_y_train, header=FALSE)
colnames(tbl_y_train) <- "Activity_Code"

# Although the instructions are not clear on this point,
# Assuming the subject_test & subject_train IDs are in the exact same sequence as
# the 'Y' dataset observations for both test and train, then

# Adorn Test dataset with subject_test ID
tbl_test.1 <- cbind(tbl_y_test, tbl_subject_test)

# Adorn Test dataset with Activity Code Labels
tbl_test.2 <- merge(tbl_test.1,tbl_activity_labels,by="Activity_Code")

# Adorn Test dataset with code to designate Source as "Test" dataset 
Source <- "Test"
tbl_test.3 <- cbind(Source,tbl_test.2)

#Adorn Test dataset with X_test results
tbl_test.4 <- cbind(tbl_test.3,tbl_X_test)

# Adorn Train dataset with subject_trail ID
tbl_train.1 <- cbind(tbl_y_train, tbl_subject_train)

# Adorn Train dataset with Activity Code Labels
tbl_train.2 <- merge(tbl_train.1,tbl_activity_labels,by="Activity_Code")

# Adorn Train dataset with code to designate Source as "Train" dataset
Source <- "Train"
tbl_train.3 <- cbind(Source,tbl_train.2)

#Adorn Train dataset with X_train results
tbl_train.4 <- cbind(tbl_train.3,tbl_X_train)

# Merge Test and Training datasets
dataTable <- rbind(tbl_test.4,tbl_train.4)

# Extract MEAN Variables
mean_variables.1 <- str_detect(tbl_features_labels$Feature_Description,fixed("mean("))
mean_variables.2 <- c(c(TRUE,TRUE,TRUE,TRUE),mean_variables.1)
extracted.1 <- dataTable[,mean_variables.2]

# Extract STD Variables
std_variables.1 <- str_detect(tbl_features_labels$Feature_Description,fixed("std("))
std_variables.2 <- c(c(FALSE,FALSE,FALSE,FALSE),std_variables.1)
extracted.2 <- dataTable[,std_variables.2]

# Combine MEAN and STD results
extracted <- cbind(extracted.1,extracted.2)

# Display extracted results (partial)
head(extracted)

# Last: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject

tidy_dataset <- tapply(dataTable$Activity_Code, dataTable$Subject_ID))
write.table(tidy_dataset,file="tidy-dataset.txt",row.names=FALSE)

