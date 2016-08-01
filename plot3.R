##
## Exploratry Data Analysis Assignment Week 1 Plot 3
## This plot creates line plots of submetering showing power ##use in different parts of the house for 1 ##family with a 1 ##minute sampling rate from February 1, 2007 ##to February 2, ##2007.
##
#### what are the W questions?
####
####  WHO is the data about? 1 household
####
####  WHAT is the data about? power consumption;
####  what are the variables?
####  Date: Date in format dd/mm/yyyy
#### Time: time in format hh:mm:ss
#### Global_active_power: household global minute-averaged ####active power (in kilowatt)
####Global_reactive_power: household global minute-averaged ####reactive power (in kilowatt)
####Voltage: minute-averaged voltage (in volt)
####Global_intensity: household global minute-averaged ####current intensity (in ampere)
####Sub_metering_1: energy sub-metering No. 1 (in watt-hour ####of active energy). It corresponds to the kitchen, ####containing mainly a dishwasher, an oven and a microwave ####(hot plates are not electric but gas powered).
####Sub_metering_2: energy sub-metering No. 2 (in watt-hour ####of active energy). It corresponds to the laundry room, ####containing a washing-machine, a tumble-drier, a refrigera####tor and a light.
####Sub_metering_3: energy sub-metering No. 3 (in watt-hour ####of active energy). It corresponds to an electric ####water-heater and an air-conditioner.
##
## WHY worryabout it, who cares? To examine the pattern in
## ## power consumtion of 1 household
##
## WHEN? for this assignment, 2 day period, February 1 and 2, ## 2007
## ## WHERE is the data coming from? UCI
## HOW? how was the data collected? 1 minute samplings rate
## over a period of almost 4 years.
##
##This  program needs the data.table package to be installed ## and then loaded and the data file for household power ## ## consumption needs to be in the working directory
## packages<- c( "data.table")
##  sapply( packages , require , character.only = TRUE , ## ## quietly = TRUE)
##
####
####
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
##
##dim(data)
##[1] 2075259       9
##
## Now put in markers for selecting Date for only 2 days
## ##
## ##
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
##
#str(subSetData)
#'data.frame':	2880 obs. of  9 variables:
# Plot 2 is a line graph
#
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
##
globalActivePower <- as.numeric(subSetData$Global_active_power)
## This plot requires 3 lines one for reading from each ##
## , on same plot, names of days  on horizontal and energy ##submetering on vertical axis label and a legend topright
##
## set variables
## ##
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
##
png("plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()

