library(data.table)
library(plyr)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","h.zip")
unzip("h.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data <- subset(NEI , fips == "24510")

d1 <- tapply(data$Emissions , data$year , sum)
png("plot2.png")
plot(as.numeric(row.names(d1)) , d1 , type = "l" ,col="red" , xlab = "years" , ylab = "total emissions in baltimore")
title("total emission in baltimore")

dev.off()