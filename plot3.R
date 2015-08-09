## A Programming assignment for Coursera course Exploratory Data Analysis
## Reads the data from a data file named household_power_consumption.txt
## and constructs a composite line graph for the sub_metering data from 
## 01/02/2007 until 02/02/2007
plot3 <- function() {
    
    ##open png device for plotting
    png("plot3.png", width = 504,height = 504, units = "px" )
    
    ##load the data
    mydata <- read.csv2("./household_power_consumption.txt")
    
    ##subset the data to rows with Data 1/2/2007 until 2/2/2007
    subdata <- mydata[mydata$Date=='2/2/2007'|mydata$Date=='1/2/2007',]
    
    ##create a new column with the combined date and time
    subdata$datetime <- strptime(paste(subdata$Date,subdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
    
    ##convert to numeric
    subdata$Sub_metering_1 <- as.numeric(as.character(subdata$Sub_metering_1))
    subdata$Sub_metering_2 <- as.numeric(as.character(subdata$Sub_metering_2))
    subdata$Sub_metering_3 <- as.numeric(as.character(subdata$Sub_metering_3))
    
    with(subdata,plot(datetime,Sub_metering_1,type = "l", col="black",xlab = "", ylab = "Energy sub metering", main = ""))
    with(subdata,points(datetime,Sub_metering_2,type = "l", col="red"))
    with(subdata,points(datetime,Sub_metering_3,type = "l", col="blue"))
    legend("topright",col=c("black","red","blue"),lty = 1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    par(yaxp=c(0,30,10))
    
    ##close the device
    dev.off()
    
}