download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              "ACS.csv", method= "curl")

x <-read.csv("ACS.csv")
ACS <- tbl_df(x)

library(dplyr)

head(ACS$VAL)
table(ACS$VAL)
unique(ACS$VAL)
summary(ACS$VAL)
ACS %>% filter(VAL == 24) %>% select(VAL)
ACS %>% select(FES)

install.packages("xlsx")
library(xlsx)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile="NGAP.xlsx", method="curl")
rowIndex=18:23
colIndex=7:15
NGAP <- read.xlsx("NGAP.xlsx", sheetIndex=1, colIndex=colIndex,rowIndex=rowIndex)
head(NGAP)
sum(NGAP$Zip*NGAP$Ext, na.rm=T)

install.packages("XML")
library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml" 
download.file(fileUrl, destfile="myXML.xml", method="curl")
doc <- xmlTreeParse("myXML.xml", useInternal=T)
rootNode <- xmlRoot(doc)
rootNode[[1]]
rootNode[[1]][[1]]
rootNode[[1]][[1]][[3]]
rootNode[[1]][[1]][[2]]

zips <- xpathSApply(rootNode, "//zipcode", xmlValue)
data.frame(zips)
zipcodes <- tbl_df(data.frame(zips))
args(select)
zipcodes %>% filter(zipcodes == "21231")

fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile="comm.csv", method="curl")
x <- read.csv("comm.csv")
install.packages("data.table")
library(data.table)
DT <- data.table(x)
rowMeans(DT)[DT$SEX==1] 
rowMeans(DT)[DT$SEX==2]
tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT$pwgtp15,by=DT$SEX)
sapply(split(DT$pwgtp15,DT$SEX),mean)
DT[,mean(pwgtp15),by=SEX]
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
