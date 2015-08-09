## A Programming assignment for Coursera course Exploratory Data Analysis
## Reads the data from a data file named household_power_consumption.txt
## and constructs a composite graph for a combination of data from 
## 01/02/2007 until 02/02/2007
plot4 <- function() {
    
    ##open png device for plotting
    png("plot4.png", width = 504,height = 504, units = "px" )
    
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
    
    ##convert Global Active Power column from text to numeric
    subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
    
    ##convert Voltage column from text to numeric
    subdata$Voltage <- as.numeric(as.character(subdata$Voltage))
    
    ##convert Global Reactive Power column from text to numeric
    subdata$Global_reactive_power <- as.numeric(as.character(subdata$Global_reactive_power))
    
    ##create 2 columns and 2 rows
    par(mfrow=c(2,2))
    
    ##plot at 1,1
    with(subdata,plot(datetime,Global_active_power,type="l",xlab = "",ylab = "Global Active Power"))
    
    ##plot at 1,2
    with(subdata,plot(datetime,Voltage,type="l",xlab = "datetime",ylab = "Voltage"))
    
    ##plot at 2,1
    par(yaxp=c(0,30,10))
    with(subdata,plot(datetime,Sub_metering_1,type = "l", col="black",xlab = "", ylab = "Energy sub metering", main = ""))
    with(subdata,points(datetime,Sub_metering_2,type = "l", col="red"))
    with(subdata,points(datetime,Sub_metering_3,type = "l", col="blue"))
    legend("topright",col=c("black","red","blue"),lty = 1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
    
    ##plot at 2,2
    with(subdata,plot(datetime,Global_reactive_power,type="l",xlab = "datetime",ylab = "Global_reactive_power"))
    
    ##close the device
    dev.off()
    
}