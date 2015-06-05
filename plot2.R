
source('getadata.R')

data <- read_power_consumption()

png(filename = 'plot2.png' , width = 480, height = 480)

plot(strptime(paste(data$Date, data$Time), format='%d/%m/%Y %H:%M:%S'), data$Global_active_power, type='l')

dev.off()
