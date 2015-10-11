#read in data
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

ylim = c(0,40)

plot(data_subset$DateTime, data_subset$Sub_metering_1, 
     'line',
     xlab = '',
     ylab = 'Energy Sub-metering',
     ylim = ylim)

par(new = T)

plot(data_subset$DateTime, data_subset$Sub_metering_2, 
     'line',
     xlab = '',
     axes = F,
     ylim = ylim,
     col = 'red',
     ylab = '')

par(new = T)

plot(data_subset$DateTime, data_subset$Sub_metering_3, 
     'line',
     xlab = '',
     axes = F,
     ylim = ylim,
     col = 'blue',
     ylab = '')

dev.copy(png, file = "plot3.png", width = 480, height = 480) 
dev.off()
