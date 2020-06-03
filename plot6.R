library(data.table)
library(plyr)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","h.zip")
unzip("h.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


NEI1 <- subset(NEI , fips=="24510" & type=="ON-ROAD")
NEI2 <- subset(NEI , fips=="06037" & type=="ON-ROAD")

data1 <- tapply(NEI1$Emissions , NEI1$year , sum)
data1 <- data.frame(Emissions = data1, year = row.names(data1) , county ="baltimore")

data2 <- tapply(NEI2$Emissions , NEI2$year , sum)
data2 <- data.frame(Emissions = data2, year = row.names(data2),county="loas angeles" )

data3 <- rbind(data1,data2)

data3$county <- as.factor(data3$county)

png("plot6.png")
g <- ggplot(data3 , aes(year,Emissions))
g + geom_point(aes(col=county)) + geom_path(data=data1 , y = data1$Emissions , x = data1$year , inherit.aes = FALSE ) + geom_path(data=data2 , y = data2$Emissions , x = data2$year , inherit.aes = FALSE )
dev.off()