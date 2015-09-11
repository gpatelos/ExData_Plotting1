# set wd to where you've unzipped household_power_consumption.txt

data <- read.csv(file = "household_power_consumption.txt", header = TRUE, sep=";")

data_sub <- data[data$Date == '1/2/2007' | data$Date == '2/2/2007',]
data_sub$Global_active_power <- as.numeric(data_sub$Global_active_power) 

png(file="plot1.png")
#Histogram Plot 1
hist(data_sub$Global_active_power, main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col = "red")

dev.off()