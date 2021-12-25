library(data.table)

data <- data.table::fread("household_power_consumption.txt", sep = ";", data.table = FALSE)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")

par(mfrow = c(2,2)) #allows four plots to be drawn together in a 2x2 fashion, with plots drawn by row

#Plot 1
plot(x = data$DateTime, y = as.numeric(data$Global_active_power), xlab = "", ylab = "Global Active Power", ty = "l")

#Plot 2
plot(x = data$DateTime, y = as.numeric(data$Voltage), xlab = "datetime", ylab = "Voltage", ty = "l")

#Plot 3
plot(x = data$DateTime, y = as.numeric(data$Sub_metering_1), xlab = "", ylab = "Energy sub metering", ty = "l")
lines(x = data$DateTime, y = as.numeric(data$Sub_metering_2), col = "red")
lines(x = data$DateTime, y = as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, cex = .6, bty = "n")

#Plot 4
plot(x = data$DateTime, y = as.numeric(data$Global_reactive_power), xlab = "datetime", ylab = "Global_reactive_power", ty = "l")

dev.off()

#Note: household_power_consumption.txt was too large for GitHub to allow to be pushed to repository. This code operates
#on the assumption that household_power_consumption.txt is in the working directory.