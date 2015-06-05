
source('getadata.R')

data <- read_power_consumption()

png(filename = 'plot1.png' , width = 480, height = 480)

hist(data$Global_active_power, main='Global Active Power',
     xlab='Global Active Power (kilowatts)', col='red')

dev.off()
