# DS-03

# Setup

rm(list=ls())
cat('\014')

getwd()

# Install RMySQL
install.packages("RMySQL")
library(RMySQL)


# To facilitate multi-device development, set up a 'path_to_data' for both my Desktop and MacBook Air
# path_to_data <- "/Users/Rick/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"
path_to_data <- "/Users/rickwrites/Dropbox/Data-Science/Coursera/DS-03-Getting-Cleaning-Data/"

setwd(path_to_data) ## Make it so, Number One (set the Working Directory to the best path)

uid <- "genome"
host_path <- "genome-mysql.cse.ucsc.edu"

focal_db <- "hg19"

ucscDB <- dbConnect(MySQL(),user=uid,db=focal_db,host=host_path)

#database_list <- dbGetQuery(ucscDB,"show databases;")
#dbDisconnect(ucscDB)
#database_list

allTables <- dbListTables(ucscDB)
length(allTables)
allTables[1:10]

