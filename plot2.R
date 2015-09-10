## Assumption: The file is already downloaded to the working directory, and unzipped
## Source: UC Irvine Machine Learning Repository
## File location: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## File name: household_power_consumption.txt

## Read electricity consumption file
##epower <- read.delim("./household_power_consumption.txt", header = TRUE, sep = ";", nrows = 6000, na.strings = "?")
epower <- read.delim("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
##Convert the Date variable from factor class to date class
epower$Date <- as.Date(epower$Date, "%d/%m/%Y")
as.POSIXlt(strptime(paste(epower$Date, epower$Time), "%Y-%m-%d %H:%M:%S"))
##As DateTime variable (concatenation of epower$Date and epower$Time)
epower$DateTime <- as.POSIXlt(strptime(paste(epower$Date, epower$Time), "%Y-%m-%d %H:%M:%S"))

##Subset dataframe to keep only Feb 1 and Feb 2, 2007 days (2880 observations)
epower_ss <- subset(epower, Date >= "2007-02-01" & Date <= "2007-02-02")
##Remove full dataset (to free memory)
rm(epower)

##Draw Plot - Plot 2
png(filename = "plot2.png", width = 480, height = 480, units ="px")
with(epower_ss, plot(DateTime,Global_active_power, type = "l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
