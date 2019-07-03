library(data.table)

data <- fread("household_power_consumption.txt", na.strings="?")
data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

data$dt <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %X")

png("plot3.png", width=480, height=480)

plot(data$Sub_metering_1 ~ data$dt,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$Sub_metering_2 ~ data$dt,
      col = "red")

lines(data$Sub_metering_3 ~ data$dt,
      col = "blue")

legend("topright",
       names(data)[7:9],
       lty = c(1,1),
       col = c("black","red","blue"))

dev.off()