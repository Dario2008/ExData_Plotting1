data <- read.table("household_power_consumption.txt", header=T, sep=";", dec = ".", colClasses = "character")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data$DateTime <- as.POSIXlt(data$DateTime)
dataplot1 <- subset(data, DateTime >= as.POSIXlt("2007-02-01 00:00:00")) 
dataplot2 <- subset(data, DateTime < as.POSIXlt("2007-02-03 00:00:00"))
head(dataplot1)
tail(dataplot2)
dataplot <- data[66637:69516, ]
x <- dataplot$DateTime
y1 <- dataplot$Sub_metering_1
y2 <- dataplot$Sub_metering_2
y3 <- dataplot$Sub_metering_3
y1 <- as.numeric(y1)
y2 <- as.numeric(y2)
y3 <- as.numeric(y3)
ymin=min(c(y1, y2, y3))
ymax=max(c(y1, y2, y3))
g1 <- dataplot$Global_active_power
g1 <- as.numeric(g1)
g2 <- dataplot$Voltage
g2 <- as.numeric(g2)
g4 <- dataplot$Global_reactive_power
g4 <- as.numeric(g4)
png(file = "Plot4.png")
par(mfrow = c(2, 2))
plot(x, g1, type = "l", xlab = "", ylab = "Global Active Power (killowatts)")
plot(x, g2, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x, y1, type = "l", ylim=c(ymin,ymax), xlab = "", ylab = "Energy sub metering")
par(new = T)
lines(x, y2, type = "l", col = "red")
lines(x, y3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, col=c("black", "red", "blue"), ncol=1,cex=0.8, bty="1", inset =c(0,0), text.col=c("black"))
par(new = F)
plot(x, g4, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()