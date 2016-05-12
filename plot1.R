temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#unzip(temp, list=T)
data <- read.table(unz(temp,unzip(temp, list=T)[1,1]),sep = ";",header = T,colClasses = "character")
unlink(temp)

library(lubridate)

daterange<-(dmy(data$Date)<=dmy("02/02/2007"))&(dmy(data$Date)>=dmy("01/02/2007"))
data2<-data[daterange,]

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(data2[[3]]),col="red",ylab="Frequency",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

