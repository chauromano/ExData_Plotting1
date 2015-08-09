## A Programming assignment for Coursera course Exploratory Data Analysis
## Reads the data from a data file named household_power_consumption.txt
## and constructs a historgram for the Global Active Power from 
## 01/02/2007 until 02/02/2007
plot1 <- function() {
    
    ##open png device for plotting
    png("plot1.png", width = 504,height = 504, units = "px" )
    
    ##load the data
    mydata <- read.csv2("./household_power_consumption.txt")
    
    ##subset the data to rows with Data 1/2/2007 until 2/2/2007
    subdata <- mydata[mydata$Date=='2/2/2007'|mydata$Date=='1/2/2007',]
    
    ##convert Global Active Power column from text to numeric
    subdata$Global_active_power <- as.numeric(as.character(subdata$Global_active_power))
    
    ##plot the Global Active Power to a historgram
    with(subdata, hist(Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",col = "red"))
    
    ##close the device
    dev.off()
    
    
}
