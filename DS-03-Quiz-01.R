# DS-03 Quiz 1

# Question 1

rm(list=ls())
cat('\014')

getwd()

install.packages("data.table")
library(data.table)

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# path_to_data <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
path_to_data <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(path_to_data) ## Make it so, Number One (set the Working Directory to the best path)

source_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
source_fn <- "source_file.csv"

download.file(source_data,source_fn,"curl")

sd <- fread(source_fn, header=TRUE)
millions <- sd[sd$VAL == 24]
millions

mill <- sd$VAL == 24
summary(mill)

# Question 3

rm(list=ls())
cat('\014')

getwd()

install.packages("xlsx")
library(xlsx)

rowIndex <- 18:23
colIndex <- 7:15

dat <- read.xlsx("DATA.gov_NGAP.xlsx",sheetIndex=1,rowIndex=rowIndex,colIndex=colIndex)
sum(dat$Zip*dat$Ext,na.rm=T) 

# Question 4

rm(list=ls())
cat('\014')

getwd()

install.packages("XML")
library(XML)

fileURL <- "./getdata-data-restaurants.xml"

xml_doc <- xmlTreeParse(fileURL,useInternal=TRUE)
rootNode <- xmlRoot(xml_doc)
xmlName(rootNode)

zips <- xpathSApply(rootNode,"//zipcode",xmlValue)
target_zip <- "21231"

targs <- zips[zips==target_zip]
summary(targs)

# Question 5

rm(list=ls())
cat('\014')
bye()
getwd()

install.packages("data.table")
library(data.table)

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# path_to_data <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
path_to_data <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(path_to_data) ## Make it so, Number One (set the Working Directory to the best path)

#source_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
source_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
source_fn <- "source_file.csv"

download.file(source_data,source_fn,"curl")

DT <- fread(source_fn, header=TRUE)
# summary(DT)

testR01 <- print(system.time(sapply(split(DT$pwgtp15,DT$SEX),mean)))
testR02 <- print(system.time(tapply(DT$pwgtp15,DT$SEX,mean)))
testR03 <- print(system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)))
testR04 <- print(system.time(mean(DT$pwgtp15,by=DT$SEX)))
testR05 <- print(system.time(rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]))
testR06 <- print(system.time(DT[,mean(pwgtp15),by=SEX]))


