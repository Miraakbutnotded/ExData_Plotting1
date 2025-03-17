
 setwd("C:/Users/plaoz/ExData_Plotting1")
 data <- read.table("household_power_consumption.txt", 
                     +                    header=TRUE, 
                     +                    sep=";", 
                     +                    na.strings="?", 
                     +                    stringsAsFactors=FALSE)
 
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data_subset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), 
                                   +                                  format="%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(data_subset$DateTime, data_subset$Global_active_power, 
         +      type="l", 
         +      xlab="", 
         +      ylab="Global Active Power (kilowatts)", 
         +      main="Global Active Power over Time")
dev.off()