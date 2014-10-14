setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")
DataSet <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
DataSet$DateTime <- strptime(paste(DataSet$Date, DataSet$Time, sep=" "), 
                             format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))
#1
plot(DataSet$DateTime, DataSet$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
#2
plot(DataSet$DateTime, DataSet$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
#3
plot(DataSet$DateTime, DataSet$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(DataSet$DateTime, DataSet$Sub_metering_2, col="red")
lines(DataSet$DateTime, DataSet$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4
plot(DataSet$DateTime, DataSet$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")

dev.off()