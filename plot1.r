# load data into R
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# only use data from 1/2/2007 to 2/2/2007
dat <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# capture the plot using png graphic device
png(file = "plot1.png", width = 480, height = 480)
hist(dat$Global_active_power, main = "Global Active Power", col = 2, xlab = "Global Active Power (kilowatts)")

# turn off the graphic device
dev.off()