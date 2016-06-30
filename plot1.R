plot1 <- function(file){
	file <- "household_power_consumption.txt"
    # Reading file into a variable for further subsetting in the next step
	temp_data <- read.table(file, sep=";", header=TRUE, colClasses=rep("character",9))
    # Subsetting data to the required dates (comparing them as characters)
	data <- subset(temp_data, temp_data$Date == "2/2/2007" | temp_data$Date == "1/2/2007")
    #Assigning NA to all missing values in the subset dataset
    data["?"==data] <- NA
    #Converting to numeric datatype
	data[,3] <- as.numeric(data[,3])
    #Initiating a png file
	png(file="plot1.png", height=480, width=480)	
	hist(data[,3], col="red", xlab="Global active Power(kW)", ylab="Frequency", main="Global Active Power")
    #Closing the device (png file)
    dev.off()
}