#Plot 3.R 
#Exploratory Data Analysis Week 1 Project Assignment
# Plot 3. 


#Initialize environment
rm(list=ls())
setwd("C:/Users/RC/Desktop/Exploratory Data Analysis")


#load UCI txt file with household power consumption data
data=read.csv('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")

#convert format of Date variable from factor to Date class
data$Date2 <- as.Date (data$Date, "%d/%m/%Y")

#Add DateTime field with class POSIXct
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")


#subset data for two dates to be included in plots

data2 = subset(data, Date2 >= "2007-02-01" & Date2 <= "2007-02-02")

#choose output device

png("plot3.png", width=480, height = 480)

#Plot 3 Energy Sub metering by DateTime

plot(data2$DateTime, data2$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data2[, "DateTime"], data2[, "Sub_metering_1"],col="black")
lines(data2[, "DateTime"], data2[, "Sub_metering_2"],col="red")
lines(data2[, "DateTime"], data2[, "Sub_metering_3"],col="blue")
legend("topright",
       col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))

dev.off()
