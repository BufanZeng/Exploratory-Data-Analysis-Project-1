# Read in file
rawdata<-read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",stringsAsFactors = FALSE)
rawdata$Time = strptime(paste(rawdata$Date, ' ', rawdata$Time), '%d/%m/%Y %H:%M:%S')
data<-rawdata[(rawdata$Time<'2007-02-03 00:00:00' & rawdata$Time>'2007-02-01 00:00:00'),]
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
# Convert into numeric 
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Voltage <- as.numeric(as.character(data$Voltage))
# Creat histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
# Create graph of time vs. gap
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
# Create plot of date/time v Sub metering 1 data
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l", col = "red" )
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# Create plot 4
par(mfcol = c(2,2))
plot(data$Time, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")
plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_2, type = "l", col = "red" )
lines(data$Time, data$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Time, data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")
plot(data$Time, data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")