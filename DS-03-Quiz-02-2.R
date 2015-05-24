# DS-03 Week 02 Quiz Question 02

rm(list=ls())
cat('\014')

getwd()

install.packages("sqldf")
library(sqldf)

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# path_to_data <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
path_to_data <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(path_to_data) ## Make it so, Number One (set the Working Directory to the best path)
getwd()

source_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

acs <- read.csv(source_data,header=TRUE)

rs <- sqldf('select pwgtp1 from acs where agep < 50')
print(head(rs))


