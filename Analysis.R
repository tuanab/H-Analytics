setwd("C:/Users/kevbu/Desktop/Data Science/Luis/JUYO")

HI <- read.csv(file="BRUHI.csv", 
               stringsAsFactors = FALSE, header=TRUE,na.strings=c(""))

RC <- read.csv(file="BRURC.csv", 
               stringsAsFactors = FALSE, header=TRUE,na.strings=c(""))

RC1 <- read.csv(file="BRURC1.csv", 
                stringsAsFactors = FALSE, header=TRUE,na.strings=c(""))

library(Amelia)
missmap(RC,main="RC missing vs observed")
missmap(RC1,main="RC1 missing vs observed")
missmap(HI,main="HI missing vs observed")

which(colnames(RC1)=="country")
which(colnames(RC)=="co")
RC1 <- RC1[-c(14,13,12,5)]
RC<- RC[-c(12,13,14,5)]

sapply(RC,function(x) sum(is.na(x)))
sapply(RC1,function(x) sum(is.na(x)))

RC1_clean <- na.omit(RC1)
RC_clean <- na.omit(RC)

scale(RC_clean$rev)
scale(RC_clean$rn)

library(ggplot2)

ggplot(RC_clean,aes(rev)) + geom_histogram(bins=40)

ggplot(RC_clean,aes(rev,rn)) + geom_point(color="blue")  #how can revenue be negative?





