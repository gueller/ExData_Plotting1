# This is the script to read the data file, isolate the required data
# and construct the first plot.

# Load the req'd libraries
library(dplyr)

# Read the table
dataTotal <- read.table("D:/DataScience/ExploratoryDataAnalysis/Week1/ElectricPowerConsumption/household_power_consumption.txt",
                   sep = ";", header = TRUE)

# subset the data for the period of interest
data<- subset(dataTotal, Date == "1/2/2007" | Date == "2/2/2007")

data2 <- data

for 

q <- length(data2$Time)
q


for (i in q) {
  if (data$Date == "2007-02-01") {
    data2$Time <- format(data2$Time, "2007-02-01 %H:%M:%S")
  }
  else {
    
    
    
  }
}







# Convert the date/times
if (data2$Date == "2007-02-01") {
  sapply(data2$Time, FUN = (paste("2007-02-01", data2$Time, 
                format = "%Y-%m-%d %H:%M:%S")))
}

data2$Date <- as.Date(data2$Date, format = "%d/%m/%Y")
data2$Time <- strptime(data2$Time, format = "%H:%M:%S")







if (data2$Date == "2007-02-01") {
  lapply(data2$Time, format(data2$Time, "2007-02-01 %H:%M:%S"))
}

if (data2$Date == "2007-02-02") {
  data2$Time <- format(data2$Time, "2007-02-02 %H:%M:%S")
}
#} else {
#  data2$Time <- format(data2$Time, "2007-02-02 %H:%M:%S")
#}






