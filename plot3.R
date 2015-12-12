png(file = "plot3.png", width = 480, height = 480)
data <- read.csv("household_power_consumption.txt",header = TRUE, sep=";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
subdata <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
subdata$DateAndTime <- as.POSIXct(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
with(subdata,{
  plot(Sub_metering_1 ~ DateAndTime, xlab= "", ylab = "Energy Sub Metering", type="n")
  lines(Sub_metering_3 ~ DateAndTime, col="blue")
  lines(Sub_metering_2 ~ DateAndTime, col ="red")
  lines(Sub_metering_1 ~ DateAndTime, col ="black")
  legend("topright", lty=1,col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
})
dev.off()


