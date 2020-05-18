# This is the script to read the data file, isolate the required data
# and construct the first plot.

# Load the req'd libraries
library(dplyr)

# Read the table
dataTotal <- read.table("C:/dataScience/electricConsumption/exdata_data_household_power_consumption/household_power_consumption.txt",
                   sep = ";", header = TRUE)

# subset the data for the period of interest
data<- subset(dataTotal, Date == "1/2/2007" | Date == "2/2/2007")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

# With a for next loop, the in has to be a list of values
# The most elegant solution here would have been to just merge the two
# columns
v <- 1:nrow(data)
for ( i in 1:nrow(data)) {
  if (data[i,"Date"] == "2007-02-01") {
    data[i,"Time"] <- format(data[i,"Time"],"2007-02-01 %H:%M:%S")
  } else {
    data[i,"Time"] <- format(data[i,"Time"],"2007-02-02 %H:%M:%S")
  }
}

# Build the plot on screen and verify that it is what I want.

#set the matrix
par(mfcol = c(2,2))

#plot 1
plot(data$Time,(as.numeric(data$Global_active_power)), type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
#plot 2
plot(data$Time,(as.numeric(data$Sub_metering_1)), type = "l",
     xlab = "", ylab = "Energy Sub metering")
lines(data$Time, (as.numeric(data$Sub_metering_1)))
lines(data$Time, (as.numeric(data$Sub_metering_2)), col = "red")
lines(data$Time, (as.numeric(data$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub-metering_2",
      "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1,
      bty = "n")
#plot 3
plot(data$Time,(as.numeric(data$Voltage)), type = "l",
     xlab = "datetime", ylab = "Voltage")
# plot 4
plot(data$Time,(as.numeric(data$Global_reactive_power)), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")


 
# Save off a copy of the plot into the filename
png(filename = "plot4.png", width = 480, height = 480)
#set the matrix
par(mfcol = c(2,2))

#plot 1
plot(data$Time,(as.numeric(data$Global_active_power)), type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
#plot 2
plot(data$Time,(as.numeric(data$Sub_metering_1)), type = "l",
     xlab = "", ylab = "Energy Sub metering")
lines(data$Time, (as.numeric(data$Sub_metering_1)))
lines(data$Time, (as.numeric(data$Sub_metering_2)), col = "red")
lines(data$Time, (as.numeric(data$Sub_metering_3)), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub-metering_2",
      "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1,
      bty = "n")
#plot 3
plot(data$Time,(as.numeric(data$Voltage)), type = "l",
     xlab = "datetime", ylab = "Voltage")
# plot 4
plot(data$Time,(as.numeric(data$Global_reactive_power)), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


