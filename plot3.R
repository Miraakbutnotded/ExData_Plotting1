# Load necessary libraries
library(datasets)

# Load the dataset using read.table
data <- read.table("household_power_consumption.txt", 
                   header=TRUE, 
                   sep=";", 
                   na.strings="?", 
                   stringsAsFactors=FALSE)

# Convert the Date column to Date format
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset the data for the dates 2007-02-01 and 2007-02-02
data_subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine Date and Time into a single DateTime column for plotting
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), 
                                 format="%Y-%m-%d %H:%M:%S")
# Load the prepared data
source("load_and_prepare_data.R")

# Plot 3: Sub_metering values vs Time
png("plot3.png", width=480, height=480)

# Create the plot
plot(data_subset$DateTime, data_subset$Sub_metering_1, 
     type="l", 
     col="black", 
     xlab="", 
     ylab="Energy sub metering", 
     main="Energy Sub Metering over Time")

# Add the other sub-metering data as lines
lines(data_subset$DateTime, data_subset$Sub_metering_2, 
      col="red")
lines(data_subset$DateTime, data_subset$Sub_metering_3, 
      col="blue")

# Add a legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), 
       lty=1)

# Save the plot
dev.off()

