library(data.table)
library(dplyr)

data <- data.table::fread("household_power_consumption.txt", sep = ";", data.table = FALSE)
data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#adds POSIXct (Date & Time) variable/column to data frame
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")

#plots 3 lines, 1 for each sub metering
plot(x = data$DateTime, y = as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, y = as.numeric(data$Sub_metering_2), col = "red")
lines(data$DateTime, y = as.numeric(data$Sub_metering_3), col = "blue")

#adds legend to top right of the plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = .7)

dev.off()

#Note: household_power_consumption.txt was too large for GitHub to allow to be pushed to repository. This code operates
#on the assumption that household_power_consumption.txt is in the working directory.