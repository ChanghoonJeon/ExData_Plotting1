temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#unzip(temp, list=T)
data <- read.table(unz(temp,unzip(temp, list=T)[1,1]),sep = ";",header = T,colClasses = "character")
unlink(temp)

library(lubridate)

daterange<-(dmy(data$Date)<=dmy("02/02/2007"))&(dmy(data$Date)>=dmy("01/02/2007"))
data2<-data[daterange,]

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(dmy_hms(paste(data2$Date,data2$Time)),as.numeric(data2[[3]]),type="l",xlab="",ylab="Global Active Power")

plot(dmy_hms(paste(data2$Date,data2$Time)),as.numeric(data2[[5]]),type="l",ylab = "Voltage",xlab = "datetime")

plot(dmy_hms(paste(data2$Date,data2$Time)),as.numeric(data2[[7]]),type="l",xlab="",ylab="Energy sub metering")
lines(dmy_hms(paste(data2$Date,data2$Time)),as.numeric(data2[[8]]),col="red")
lines(dmy_hms(paste(data2$Date,data2$Time)),as.numeric(data2[[9]]),col="blue")
legend("topright",lty=1,col = c("black","red","blue"),legend = c(names(data2)[7:9]))

plot(dmy_hms(paste(data2$Date,data2$Time)),as.numeric(data2[[4]]),type="l",ylab = "Global_reactive_power",xlab = "datetime")

dev.off()