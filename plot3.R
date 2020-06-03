library(data.table)
library(plyr)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","h.zip")
unzip("h.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##subsettig for baltimore data
data <- subset(NEI , fips == "24510")
data$type <- as.factor(data$type)

d1 <- subset(data , year==1999)
sum1 <- tapply(d1$Emissions , d1$type, sum)
type <- row.names(sum1)
data1999 <- data.frame(type = type , Emissions = sum1 , year =1999)

d1 <- subset(data , year==2002)
sum1 <- tapply(d1$Emissions , d1$type, sum)
type <- row.names(sum1)
data2002 <- data.frame(type = type , Emissions = sum1 , year =2002)

d1 <- subset(data , year==2005)
sum1 <- tapply(d1$Emissions , d1$type, sum)
type <- row.names(sum1)
data2005 <- data.frame(type = type , Emissions = sum1 , year =2005)

d1 <- subset(data , year==2008)
sum1 <- tapply(d1$Emissions , d1$type, sum)
type <- row.names(sum1)
data2008 <- data.frame(type = type , Emissions = sum1 , year =2008)

data <- rbind(data1999,data2002,data2005,data2008)

png("plot3.png")
g  <-  ggplot(data , aes(x=year , y = Emissions))

g + geom_point(aes(col = type)) + geom_smooth(method = "lm" , aes(col = type)) +ggtitle("Baltimore Emmisions year wise and type wise") 

dev.off()

##it can be seen each type of source pm 