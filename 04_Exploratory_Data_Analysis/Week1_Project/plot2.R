library(data.table)

data <- fread("household_power_consumption.txt", na.strings="?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$dt <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %X")

png("plot2.png", width=480, height=480)

plot(data$Global_active_power ~ data$dt,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()