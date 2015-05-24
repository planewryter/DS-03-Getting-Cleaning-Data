# DS-03 Week 03 Quiz 03 Question 03

rm(list=ls())
cat('\014')

getwd()

# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# working_directory <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
working_directory <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(working_directory) ## Make it so, Number One (set the Working Directory to the best path)
getwd()

# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 

source_dataset_03_03_GDP <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

target_dataset_03_03_GDP <- "GDP.csv"

download.file(source_dataset_03_03_GDP,target_dataset_03_03_GDP,"curl")

df.GDP.raw <- read.csv(target_dataset_03_03_GDP,skip=4,strip.white=TRUE,blank.lines.skip=TRUE,colClasses=c("X.1"="character","X.4"="character"))
df.GDP.ranked <- subset(df.GDP.raw,X.1 %in% 1:190)
df.GDP.ranked$GDP.Value <- as.numeric(gsub(",","",df.GDP.ranked$X.4))
df.GDP.ranked$GDP.Rank <- as.numeric(df.GDP.ranked$X.1)
                 
# Load the educational data from this data set: 

source_dataset_03_03_Education <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

target_dataset_03_03_Education <- "FEDSTATS_Education.csv"

download.file(source_dataset_03_03_Education,target_dataset_03_03_Education,"curl")

df.Education <- read.csv(target_dataset_03_03_Education)

# Match the data based on the country shortcode. GDP -- X; Country -- CountryCode
# How many of the IDs match? 

merged <- merge(df.GDP.ranked,df.Education,by.x="X",by.y="CountryCode",all=FALSE,sort=TRUE)  ## NA?

# Sort the data frame in descending order by GDP rank (so United States is last).
# What is the 13th country in the resulting data frame? 

ordered <- merged[order(merged$GDP.Value),]

HI.OECD <- ordered[(ordered$Income.Group == "High income: OECD"),]
Avg.HI.OECD.Rank <- mean(HI.OECD$GDP.Rank)

HI.nonOECD <- ordered[(ordered$Income.Group == "High income: nonOECD"),]
Avg.HI.nonOECD.Rank <- mean(HI.nonOECD$GDP.Rank)

quants <- quantile(merged$GDP.Rank)

table.1 <- table(merged$Income.Group,quants)
table.1
table.2 <- table(quants,merged$Income.Group)
table.2

hack <- merged[order(merged$Income.Group,merged$GDP.Rank),]
