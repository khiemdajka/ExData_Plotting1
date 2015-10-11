# load data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# only use data from 1/2/2007 to 2/2/2007
dat <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# merge Date and Time into one variable
dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# capture the plot using png graphic device
png(file = "plot2.png", width = 480, height = 480)
plot(dat$DateTime,dat$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# turn off the graphic device
dev.off()