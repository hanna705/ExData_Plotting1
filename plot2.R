setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")
DataSet <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
DataSet$DateTime <- strptime(paste(DataSet$Date, DataSet$Time, sep=" "), 
                             format="%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(DataSet$DateTime, DataSet$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)" )

dev.off()