# load data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# only use data from 1/2/2007 to 2/2/2007
dat <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# merge Date and Time into one variable
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# capture the plot using png graphic device
png(file = "plot4.png", width = 480, height = 480)

# divide the graphic panel into 2x2
par(mfcol = c(2,2))

# plot 1
plot(dat$DateTime, dat$Global_active_power, type= "l", lwd = 1, ylab = "Global Active Power (kilowatts)", xlab = "")

# plot 2
plot(dat$DateTime, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat$DateTime, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$DateTime, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", col = c("black", "red", "blue"))

# plot 3
plot(dat$DateTime, dat$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# plot 4
plot(dat$DateTime, dat$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

# turn off the graphic device
dev.off()
