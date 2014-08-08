##
## Exploratory Data Analysis - Course Project 2014/08 plot2.R
##
## The goal is to load the Individual household electric power consumption Data Set,
## examine how household energy usage varies over a 2-day period in February, 2007,
## and do some plot.
##
## The input data set contains:
## Measurements of electric power consumption in one household with a
## one-minute sampling rate over a period of almost 4 years. 
## Different electrical quantities and some sub-metering values are available.        

# change working directory, use IF necessary
# setwd("C:/Documents and Settings/c048978/My Documents/Personali/Sorgenti/R/Exploratory Data Analysis/Course Project1/") #change working directory

# change local setting to USA, use IF necessary
#Sys.setlocale("LC_TIME", "en_US.UTF-8") 

# load library used in the script 
library(downloader) # need it for dowload from https

# check if file with data exists and, if not, download and unzip it in the working directory
if(!file.exists("household_power_consumption.txt")){
    download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
             "exdata-data-household_power_consumption.zip")
    unzip("exdata-data-household_power_consumption.zip")
}

# load input CSV data set
ds <- read.csv("household_power_consumption.txt", 
               header= TRUE, 
               sep = ";", 
               na.strings = "?")

# convert date and time in POSIXlt Date
ds$Date <- strptime(paste(ds$Date,ds$Time), "%d/%m/%Y %H:%M:%S")

# keep only the dates between 2007-02-01 and 2007-02-02 and drop row.names
dsShort <- ds[ds$Date  >= "2007-02-01" & ds$Date < "2007-02-03", ]
row.names (dsShort) <- NULL

# draw plot2
plot(dsShort$Date, dsShort$Global_active_power, 
     xlab = "", 
     ylab= "Global Active Power (kilowatts)",
     type='l') 

# save plot2 and close the PNG device
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
