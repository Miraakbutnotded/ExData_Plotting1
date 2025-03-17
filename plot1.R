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
png("plot1.png", width=480, height=480)

# Create the histogram
hist(data_subset$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     col="red", 
     breaks=12)

# Save the plot
dev.off()