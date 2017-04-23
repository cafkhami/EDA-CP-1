##Exploratory Data Analysis - Course Project 1

#set the wd
setwd("~")
setwd("/Coursera/Data Science/EDA/EDA-CP-1")

#Read in the data and set it up for analysis
powerData <- read.table(
  "household_power_consumption.txt",
  sep = ";",
  header = TRUE,
  stringsAsFactors = FALSE,
  na.strings = "?"
)

#Change the date and time to the correct formats
powerData$Date <- as.Date(powerData$Date)
powerData$Time <- strptime(powerData$Time, "%H:%M:%S")
