#Plot 1.R 
#Exploratory Data Analysis Week 1 Project Assignment
# Plot 1. Histogram of Global Active Power frequency in kilowatts

#Initialize environment
rm(list=ls())
setwd("C:/Users/RC/Desktop/Exploratory Data Analysis")


#load UCI txt file with household power consumption data
data=read.csv('household_power_consumption.txt', sep = ';', header = TRUE, na.strings = "?")

#convert format of Date variable from factor to Date class
data$Date2 <- as.Date (data$Date, "%d/%m/%Y")


#subset data for two dates to be included in plots

data2 = subset(data, Date2 >= "2007-02-01" & Date2 <= "2007-02-02")

#choose output device

png("plot1.png", width=480, height = 480)

#Plot 1 Histogram

hist (as.numeric(data2$Global_active_power), main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.off()
