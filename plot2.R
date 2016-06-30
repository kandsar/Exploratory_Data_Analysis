plot2 <- function(file){
	file <- "household_power_consumption.txt"
    # Reading file into a variable for further subsetting in the next step
	temp_data <- read.table(file, sep=";", header=TRUE, colClasses=rep("character",9))
    # Subsetting data to the required dates (comparing them as characters)
	data <- subset(temp_data, temp_data$Date == "2/2/2007" | temp_data$Date == "1/2/2007")
    #Creating timestamps using strptime() for plotting
	timestamp <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
    #Converting to numeric datatype
	data$Global_active_power <- as.numeric(data$Global_active_power)
    #Initiating a png file
	png("plot2.png", height=480, width=480)
	plot(timestamp, data$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
    #Closing the device (png file)
	dev.off()
}