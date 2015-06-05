
source('getadata.R')

data <- read_power_consumption()
time_period <- strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S')

png(filename = 'plot4.png' , width = 480, height = 480)

par(mfrow=c(2,2))

# plot 1
plot(time_period, data$Global_active_power, type='l')
# plot 2
plot(time_period, data$Voltage, type='l')
# plot 3
plot(time_period, data$Sub_metering_1, type='l')
lines(time_period, data$Sub_metering_1, col='black')
lines(time_period, data$Sub_metering_2, col='red')
lines(time_period, data$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), lty=1, box.lwd=0)
# plot 4
plot(time_period, data$Global_reactive_power, type='l')

dev.off()
