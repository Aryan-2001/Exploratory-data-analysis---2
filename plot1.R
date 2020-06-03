## loading librariries
library(plyr)


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip","h.zip")
unzip("h.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

d1 <- subset(NEI , year == 1999)
d1$SCC <- as.factor(d1$SCC)
y_1999 <- tapply(d1$Emissions,d1$SCC,sum)
x_1999 <- row.names(y_1999)

d2 <- subset(NEI , year == 2002)
d2$SCC <- as.factor(d2$SCC)
y_2002 <- tapply(d2$Emissions,d2$SCC,sum)
x_2002 <- row.names(y_2002)

d3 <- subset(NEI , year == 2005)
d3$SCC <- as.factor(d3$SCC)
y_2005 <- tapply(d3$Emissions,d3$SCC,sum)
x_2005 <- row.names(y_2005)

d4 <- subset(NEI , year == 2008)
d4$SCC <- as.factor(d4$SCC)
y_2008 <- tapply(d4$Emissions,d4$SCC,sum)
x_2008 <- row.names(y_2008)

png("plot1.png")
plot(x=x_1999,y=y_1999, col = "red" ,pch = 19 ,ylim = c(0,2000) ,xlab = "Sources" ,ylab = "PM 2.5")
abline(h = mean(y_1999) , lwd = 2 , lty = 2,col="red")
points(x=x_2002 , y=y_2002 ,col = "blue" ,pch = 19 )
abline(h = mean(y_2002) , lwd = 2 , lty = 2,col="blue")
points(x=x_2005 , y=y_2005 ,col = "green" ,pch = 19 )
abline(h = mean(y_2005) , lwd = 2 , lty = 2,col="green")
points(x=x_2008 , y=y_2008 ,col = "black" ,pch = 19 )
abline(h = mean(y_2008) , lwd = 2 , lty = 2,col="black")
legend("topright" , lty=2 , lwd = .5 , col=c("red","blue","green","black") , legend=c("1999","2002","2005","2008"))
title(main ="Total PM 2.5 across years")
dev.off()

##you can see mean is decresind as the year increases