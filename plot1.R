plot1 <- function(filePath){
     data <- read.csv(filePath, sep = ';', 
                      colClasses = list('character', 'NULL', 'numeric', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL'), 
                      stringsAsFactors = FALSE, na.strings = '?')
     data$Date <- as.Date(data$Date, '%d/%m/%Y')
     data <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-2" )
     histResults <- hist(data$Global_active_power, xlab = 'Global Active Power (kilowatts', ylab ='Frequency', 
          main = 'Global Active Power', col ='red')
     dev.copy(png, file = 'plot1.png')
     dev.off()
}

##plot1('txt file path')