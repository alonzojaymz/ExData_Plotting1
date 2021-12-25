library(data.table)

data <- data.table::fread("household_power_consumption.txt", sep = ";", data.table = FALSE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

#adds POSIXct (date & time) variable/column to data frame 
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(x = data$DateTime, y = as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

#Note: household_power_consumption.txt was too large for GitHub to allow to be pushed to repository. This code operates
#on the assumption that household_power_consumption.txt is in the working directory.