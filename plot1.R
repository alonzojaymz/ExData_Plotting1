#File makes a histogram plot of the global active power of a household in kilowatts taken at 1 minute intervals over a
#period of two days in 2007. The histogram is copied into a png file.
library(data.table)

data <- fread(file = "household_power_consumption.txt", sep = ";", data.table = FALSE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") #Selects only data for February 1st and 2nd of 2007

png("plot1.png") #creates png graphics device for plot to be drawn; default size is 480 x 480

hist(as.numeric(data$Global_active_power), xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

dev.off()

#Note: household_power_consumption.txt was too large for GitHub to allow to be pushed to repository. This code operates
#on the assumption that household_power_consumption.txt is in the working directory.

