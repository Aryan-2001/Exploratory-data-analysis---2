## loading librariries
library(plyr)


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","h.zip")
unzip("h.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- NEI

d1 <- tapply(data$Emissions , data$year , sum)
png("plot1.png")
plot(as.numeric(row.names(d1)) , d1 , type = "l" ,col="red" , xlab = "years" , ylab = "total emissions in the year")
title("total emission in US")

dev.off()