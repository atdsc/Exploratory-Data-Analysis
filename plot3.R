plot3 <- function(file){
     data <- read.csv(file, sep = ';',
                        colClasses = list('character', 'character', 'NULL', 'NULL', 'NULL', 'NULL', 'numeric', 'numeric', 'numeric'),
                        stringsAsFactors = FALSE, na.strings = '?')
     data <- subset(data, data$Date == '1/2/2007' | data$Date == '2/2/2007')
     data$datetime <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
     plot(data$datetime, data$Sub_metering_1, , xlab = '', ylab ='Energy sub metering', type = 'n')
     lines(data$datetime, data$Sub_metering_1, type = 'l', col ='black')
     lines(data$datetime, data$Sub_metering_2, type = 'l', col = 'red')
     lines(data$datetime, data$Sub_metering_3, type = 'l', col = 'blue')
     legend('topright', lwd = 1, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
            , col = c('black', 'red', 'blue'))
     dev.copy(png, file = 'plot3.png')
     dev.off()
}

## plot3('file')