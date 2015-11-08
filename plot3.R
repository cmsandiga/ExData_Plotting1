png("./plot3.png", width=480, height=480)
raw_data <- read.csv("./household_power_consumption.txt", sep = ";", stringsAsFactors = F)
raw_data$Date <- as.Date(raw_data$Date, format='%d/%m/%Y')
raw_data$Time <- strptime(paste(raw_data$Date,raw_data$Time), "%Y-%m-%d %H:%M:%S")
raw_data$Global_active_power <- as.numeric(raw_data$Global_active_power)

raw_data$Sub_metering_1 <- as.numeric(raw_data$Sub_metering_1)
raw_data$Sub_metering_2 <- as.numeric(raw_data$Sub_metering_2)
raw_data$Sub_metering_3 <- as.numeric(raw_data$Sub_metering_3)

d1 <- as.Date('2007-02-01', format='%Y-%m-%d')
d2 <- as.Date('2007-02-02', format='%Y-%m-%d')
XX
data <- subset(raw_data, Date == d1 | Date == d2)

Sys.setlocale("LC_TIME", "en_US.UTF-8")

with(data, plot(Time, Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering"))
with(subset(data), points(Time, Sub_metering_2, type="l",col="red"))
with(subset(data), points(Time, Sub_metering_3, type="l",col="blue"))
legend("topright", pch="-",lwd=2, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

