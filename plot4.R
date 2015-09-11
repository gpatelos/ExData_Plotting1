# set wd to where you've unzipped household_power_consumption.txt 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

data_sub <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

data_sub$datetime <- strptime(paste(data_sub$Date, data_sub$Time), "%d/%m/%Y %H:%M:%S")
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power)
data_sub$Global_reactive_power <- as.numeric(data_sub$Global_reactive_power)
data_sub$Voltage <- as.numeric(data_sub$Voltage)
data_sub$Sub_metering_1 <- as.numeric(data_sub$Sub_metering_1)
data_sub$Sub_metering_2 <- as.numeric(data_sub$Sub_metering_2)
data_sub$Sub_metering_3 <- as.numeric(data_sub$Sub_metering_3)

png(file="plot4.png")
par(mfcol=c(2, 2))

# Global Active Power
with(data_sub, plot(datetime, Global_active_power, type="l", xlab = "", ylab="Global Active Power"))

# Energy sub metering
with(data_sub, {
        plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(datetime, Sub_metering_2, type="l", col="red")
        lines(datetime, Sub_metering_3, type="l", col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), box.lty=0)
box()

# Voltage
with(data_sub, plot(datetime, Voltage, type="l", xlab = "datetime"))

# Global Reactive Power
with(data_sub, plot(datetime, Global_reactive_power, type="l", xlab = "datetime"))
dev.off()