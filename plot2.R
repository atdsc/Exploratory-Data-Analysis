plot2 <- function(file){
     data <- read.csv(file, sep =';',
                      colClasses = list('character', 'character', 'numeric', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL'), 
                      stringsAsFactors = FALSE, na.strings = '?')
     data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007" ,]
     data$datetime <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')
     plot(data$datetime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatts)', type ='n')     
     lines(data$datetime, data$Global_active_power, type = 'l')
     dev.copy(png, file = 'plot2.png')
     dev.off()
}

## plot2('filepath')
