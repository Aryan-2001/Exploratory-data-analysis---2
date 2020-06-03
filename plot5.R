library(data.table)
library(plyr)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","h.zip")
unzip("h.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEI <- subset(NEI , fips=="24510" & type=="ON-ROAD")

data1 <- tapply(NEI$Emissions , NEI$year , sum)
data1 <- data.frame(Emissions = data1, year = row.names(data1))

png("plot5.png")
plot(y=data1$Emissions , x=data1$year , col ="green" , type="l" , xlab = "year" ,ylab = "total emission from vehicles")
title("Total emmision by baltimore motor vehicles ")
dev.off()