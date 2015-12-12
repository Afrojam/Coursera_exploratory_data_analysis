png(file = "plot2.png", width = 480, height = 480)
data <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
subdata$DateAndTime <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
with(subdata,{
  plot(Global_active_power ~ DateAndTime, xlab= "", ylab = "Global Active Power (kilowatts)", type="n")
  lines(Global_active_power ~ DateAndTime)
})
dev.off()


