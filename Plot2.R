#Plot 2.R 
#Exploratory Data Analysis Week 1 Project Assignment
# Plot 2. 


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

png("plot2.png", width=480, height = 480)

#Plot 2 Global Active Power by DateTime
plot(x = data2[, "DateTime"],
     y = data2[, "Global_active_power"],
     type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
