##
## Exploratory Data Analysis - Course Project 2014/08 plot1.R
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

# load input CSV data set
ds <- read.csv("household_power_consumption.txt", header= TRUE, sep = ";", na.strings = "?")

# convert Date from gg/mm/yyyy to yyyymmgg
ds$Date  <- format(as.Date(ds$Date, "%d/%m/%Y"), "%Y%m%d")

# keep only the dates  between 2007-02-01 and 2007-02-02 and drop row.names
dsShort <- ds[ds$Date  >= "20070201" & ds$Date <= "20070202",]
row.names (dsShort) <- NULL

# draw histogram
hist(dsShort$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")

# save plot1 and close the PNG device
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

