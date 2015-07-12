plot4 <- function(file){
     data <- read.csv(file, sep = ';',
                      colClasses = c('character', 'character', 'numeric', 
                                     'numeric', 'numeric', 'NULL', 'numeric', 'numeric', 'numeric'),
                      stringsAsFactors = FALSE, na.strings = '?')
     data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
     data$datetime <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
     par(mfrow = c(2, 2))
     plot(data$datetime, data$Global_active_power, ylab = 'Global Active Power', xlab = '', type = 'n')
     lines(data$datetime, data$Global_active_power, type = 'l')
     plot(data$datetime, data$Voltage, ylab = 'Voltage', xlab = 'datetime', type = 'n')
     lines(data$datetime, data$Voltage, type = 'l')
     plot(data$datetime, data$Sub_metering_1, ylab = 'Energy sub metering', xlab = '', type = 'n')
     lines(data$datetime, data$Sub_metering_1, type = 'l', col = 'black')
     lines(data$datetime, data$Sub_metering_2, type = 'l', col = 'red')
     lines(data$datetime, data$Sub_metering_3, type = 'l', col = 'blue')
     plot(data$datetime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type ='n')
     lines(data$datetime, data$Global_reactive_power, type = 'l')
     dev.copy(png, file = 'plot4.png')
     dev.off()
}

plot4('C:/Users/Andy/Desktop/Exploratory Data Analysis/Week1/household_power_consumption.txt')