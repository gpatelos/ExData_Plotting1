# set wd to where you've unzipped household_power_consumption.txt 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)

data_sub <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]

data_sub$datetime <- strptime(paste(data_sub$Date, data_sub$Time), "%d/%m/%Y %H:%M:%S")
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power) 

png(file="plot2.png")
#Plot 2
with(data_sub, plot(datetime, Global_active_power, type="l", xlab = "", ylab="Global Active Power (kilowatts)"))
dev.off()