
source('getadata.R')
# set locale to force english weekdays
Sys.setlocale(locale='en_US')

data <- read_power_consumption()
time_period <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

png(filename = 'plot3.png' , width = 480, height = 480)

plot(time_period, data$Sub_metering_1, type='l', ylab='Energy sub metering', xlab='')
lines(time_period, data$Sub_metering_1, col='black')
lines(time_period, data$Sub_metering_2, col='red')
lines(time_period, data$Sub_metering_3, col='blue')

legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=1)

dev.off()
