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
for ( i in v) {
  if (data[i,"Date"] == "2007-02-01") {
    data[i,"Time"] <- format(data[i,"Time"],"2007-02-01 %H:%M:%S")
  } else {
    data[i,"Time"] <- format(data[i,"Time"],"2007-02-02 %H:%M:%S")
  }
}

