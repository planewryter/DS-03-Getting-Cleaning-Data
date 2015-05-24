# DS-03 Week 03 Quiz 03 Question 01

rm(list=ls())
cat('\014')

getwd()

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# working_directory <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
working_directory <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(working_directory) ## Make it so, Number One (set the Working Directory to the best path)
getwd()

source_dataset <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

target_dataset <- "Quiz-03.csv"

download.file(source_dataset,target_dataset,"curl")

df <- read.csv(target_dataset)

# Create a logical vector that identifies the households on greater than 10 acres who sold more than $10,000 worth of agriculture products
# TYPE == 1
# ACR == 3
# AGS == 6

result_ag <- df[which(df$TYPE==1 & df$ACR == 3 & df$AGS == 6),]

agricultureLogical <- (df$TYPE==1) & (df$ACR == 3) & (df$AGS == 6)

r <- which(agricultureLogical)
