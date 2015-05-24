# DS-03 Week 03 Quiz 03 Question 02

rm(list=ls())
cat('\014')

getwd()

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# working_directory <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
working_directory <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(working_directory) ## Make it so, Number One (set the Working Directory to the best path)
getwd()

# Install R Package
package <- "jpeg"
install.packages("jpeg")
library(jpeg)

source_dataset_03_02 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

target_dataset_03_02 <- "jeff.jpg"

download.file(source_dataset_03_02,target_dataset_03_02,"curl")

# Using the jpeg package read in the following picture of your instructor into R 

img <- readJPEG(target_dataset_03_02, native = TRUE)

# Use the parameter native=TRUE. 
# What are the 30th and 80th quantiles of the resulting data?
# (some Linux systems may produce an answer 638 different for the 30th quantile)

qs <- c(.30,.80)

r <- quantile(img, probs = qs)

