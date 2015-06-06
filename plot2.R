
source('getadata.R')
# set locale to force english weekdays
Sys.setlocale(locale='en_US')

data <- read_power_consumption()

png(filename = 'plot2.png' , width = 480, height = 480)

plot(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'),
     data$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='' )
axis(1, at=1:3, labels=c('Thu', 'Fri', 'Sat'))

dev.off()
