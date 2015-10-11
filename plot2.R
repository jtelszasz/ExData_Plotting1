# read in data
data <- read.delim('household_power_consumption.txt',
                header = TRUE,
                sep = ';',
                na.strings = '?',
                stringsAsFactors = FALSE) 

# parse date/times
data$DateTime <- as.POSIXct(paste(data$Date,data$Time),
                format = "%d/%m/%Y %H:%M:%S") 

date1 = '2007-02-01 00:00:00'
date2 = '2007-02-02 24:00:00'

data_subset <- data[data$DateTime >= date1 & data$DateTime <= date2, ]

# Plot 2
plot(data_subset$DateTime, data_subset$Global_active_power, 
     'line',
     xlab = '',
     ylab = 'Global Active Power (kilowatts)')

dev.copy(png, file = "plot2.png", width = 480, height = 480) 
dev.off()