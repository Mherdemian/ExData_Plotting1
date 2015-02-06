myData <- file("household_power_consumption.txt")
myTable <- read.table(text = grep("^[1,2]/2/2007", readLines(myData), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
#data subset
myTable$Date <- as.Date(myTable$Date, format = "%d/%m/%Y")
myData2 <- subset(myTable, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(myTable)
time <- paste(as.Date(myData2$Date), myData2$Time)
myData2$time <- as.POSIXct(time)
plot(myData2$Global_active_power ~ myData2$time, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")