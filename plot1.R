setwd("~/Desktop")
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract needed dataset
DataSet <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# convert the Date and Time variables
DataSet$DateTime <- strptime(paste(DataSet$Date, DataSet$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Open png graphic device
png("plot1.png", width=480, height=480)

# Plot the histogram
hist(DataSet$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Turn off device
dev.off()