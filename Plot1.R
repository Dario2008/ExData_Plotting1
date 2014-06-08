data <- read.table("household_power_consumption.txt", header=T, sep=";", dec = ".", colClasses = "character")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
data$DateTime <- as.POSIXlt(data$DateTime)
dataplot1 <- subset(data, DateTime >= as.POSIXlt("2007-02-01 00:00:00")) 
dataplot2 <- subset(data, DateTime < as.POSIXlt("2007-02-03 00:00:00"))
head(dataplot1)
tail(dataplot2)
dataplot <- data[66637:69516, ]
g1 <- dataplot[Global_active_power]
g1 <- as.numeric(g1)
png(file = "Plot1.png")
hist(g1, main = "Global Active Power", xlab = "Global Active Power (killowatts)", col = "red")
dev.off()