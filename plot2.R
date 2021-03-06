png("./plot2.png", width=480, height=480)
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
file <- unz(temp, "household_power_consumption.txt")
raw_data <- read.csv(file, sep = ";", stringsAsFactors = F)

raw_data$Date <- as.Date(raw_data$Date, format='%d/%m/%Y')
raw_data$Time <- strptime(paste(raw_data$Date,raw_data$Time), "%Y-%m-%d %H:%M:%S")
raw_data$Global_active_power <- as.numeric(raw_data$Global_active_power)

d1 <- as.Date('2007-02-01', format='%Y-%m-%d')
d2 <- as.Date('2007-02-02', format='%Y-%m-%d')

data <- subset(raw_data, Date == d1 | Date == d2)

Sys.setlocale("LC_TIME", "en_US.UTF-8")
plot(data$Time,data$Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "")

dev.off()

