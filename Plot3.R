#EDA Course Project 1 - Plot3

plot3 <- function(){
  #Set the working directory
  setwd("~/Coursera/Data Science/EDA/EDA-CP-1")
  
  #Check if the file exists and download and unzip if necessary
  if(!file.exists("CP-Data.Zip")){
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  "CP-Data.Zip")
  }
  if(!file.exists("household_power_consumption.txt")){
    unzip("CP-Data.Zip")
  }
  
  #Load the data into memory
  powerData <- read.table(
    "household_power_consumption.txt",
    sep = ";",
    header = TRUE,
    stringsAsFactors = FALSE,
    na.strings = "?"
  )
  
  #Subset the data to only 2007-02-01 to 2007-02-02
  x <- as.Date(c("2007-02-01","2007-02-02"))
  powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
  
  feb <- powerData$Date == x[1] | powerData$Date == x[2]
  
  data.feb <- powerData[feb,]
  
  #Convert the time and create a single date time column
  datetime <- strptime(paste(data.feb$Date, data.feb$Time), "%Y-%m-%d %H:%M:%S")
  
  data.feb <- cbind(datetime, data.feb)
  
  #Create Plot3.png
  
  #open the png device
  png("Plot3.png")
  
  plot(data.feb$datetime,
       data.feb$Sub_metering_1,
       type = "l",
       xlab = "",
       ylab = "Energy sub metering")
  lines(data.feb$datetime,
        data.feb$Sub_metering_2,
        type = "l",
        col = "red")
  lines(data.feb$datetime,
        data.feb$Sub_metering_3,
        type = "l",
        col = "blue")
  legend("topright",
         pch = "--",
         col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Close the png
  dev.off()
}