# DS-03 Week 02 Quiz 02 Question 04

rm(list=ls())
cat('\014')

getwd()

pkgs <- c('httr', 'httpuv', 'XML')

install.packages(pkgs)

library(httpuv)
library(httr)
library(XML)

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# working_directory <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
working_directory <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(working_directory) ## Make it so, Number One (set the Working Directory to the best path)
getwd()

path_to_data <- "http://biostat.jhsph.edu/~jleek/contact.html"

html2 <- readLines(path_to_data)
print(nchar(html2[10]))
print(nchar(html2[20]))
print(nchar(html2[30]))
print(nchar(html2[100]))


# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page: 
# content2 <- content(h,as="text")
# parsedHTML <- htmlParse(content2,asText=TRUE)

# parsedHTML <- xmlTreeParse(content2,useInternalNodes=TRUE)
# rootNode <- xmlRoot(parsedHTML)
# xmlName(rootNode)

url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
#widths <- c(9,4,4,4,4,4,4,4,4)
#fwf <- read.fwf(url,widths=widths,skip=3,header=TRUE,sep=" ")

formats <- c("1X","A9","5X","F4.0","F4.0","5X","F4.0","F4.0","5X","F4.0","F4.0","5X","F4.0","F4.0")
df <- read.fortran(url,formats,skip=4)
print(sum(df[4]))

