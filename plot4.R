plot4 <- function(file){
	file <- "household_power_consumption.txt"
    # Reading file into a variable for further subsetting in the next step
	temp_data <- read.table(file, sep=";", header=TRUE, colClasses=rep("character",9))
    # Subsetting data to the required dates (comparing them as characters)
    data <- subset(temp_data, temp_data$Date == "2/2/2007" | temp_data$Date == "1/2/2007")
    #Creating timestamps using strptime() for plotting
	timestamp <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    #Converting to numeric datatype
	data$Global_active_power <- as.numeric(data$Global_active_power)
	data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
	data$Voltage <- as.numeric(data$Voltage)
	data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
	data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
	data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
    #Initiating a png file
	png("plot4.png", height=480, width=480)
    #Creating a 2*@ canvas for plotting 4 plots
	par(mfrow=c(2,2))
	plot(timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
	plot(timestamp, data$Voltage, type="l", xlab="Datetime", ylab="Voltage")
	plot(timestamp, data$Sub_metering_1, col="black", type="l", xlab="", ylab="Energy Sub-metering")
		lines(timestamp, data$Sub_metering_2, col="red", type="l")
		lines(timestamp, data$Sub_metering_3, col="blue", type="l")
		legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"))
	plot(timestamp, data$Global_reactive_power, type="l", xlab="Datetime", ylab="Global Reactive Power(kilowatts)")
    #Closing the device (png file)
	dev.off()
}