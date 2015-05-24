rm(list=ls())
cat('\014')

numbersAsText <- c("10", "100", "11", "9","1000")
nAsFactors <- as.factor(numbersAsText)
convert2number <- as.numeric(nAsFactors)
convertViacharacter <- as.numeric(as.character(nAsFactors))
sum(convert2number)
sum(convertViacharacter)
convert2number
convertViacharacter