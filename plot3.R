setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")
DataSet <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]
DataSet$DateTime <- strptime(paste(DataSet$Date, DataSet$Time, sep=" "), 
                             format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(DataSet$DateTime, DataSet$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(DataSet$DateTime, DataSet$Sub_metering_2, col="red")
lines(DataSet$DateTime, DataSet$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()