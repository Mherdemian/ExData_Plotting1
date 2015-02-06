myData <- file("household_power_consumption.txt")
myTable <- read.table(text = grep("^[1,2]/2/2007", readLines(myData), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
par(mfrow = c(2,2))
with(data, {
  plot(Global_active_power ~ time, type = "l", 
       ylab = "Global Active Power", xlab = "time")
  plot(Voltage ~ time, type = "l", ylab = "Voltage", xlab = "time")
  plot(Sub_metering_1 ~ time, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ time, col = 'Red')
  lines(Sub_metering_3 ~ time, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ time, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
