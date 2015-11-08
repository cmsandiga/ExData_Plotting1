raw_data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = F)
raw_data$Date <- as.Date(raw_data$Date, format='%d/%m/%Y')
raw_data$Time <- strptime(raw_data$Time, "%H:%M:%S")
raw_data$Global_active_power <- as.numeric(raw_data$Global_active_power)

d1 <- as.Date('2007-02-01', format='%Y-%m-%d')
d2 <- as.Date('2007-02-02', format='%Y-%m-%d')

data <- subset(raw_data, Date == d1 | Date == d2)

hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main='Global Active Power')

dev.copy(png,"./plot1.png", width=480, height=480)
dev.off()