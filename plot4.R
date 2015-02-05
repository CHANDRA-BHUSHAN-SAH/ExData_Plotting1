# Loading power consumption data of date between 2007-02-01 and 2007-02-02
ds <- read.table("household_power_consumption.txt", header=T, sep=";")
df <- power[(ds$Date=="1/2/2007") | (ds$Date=="2/2/2007"),]

Voltage <- as.numeric(as.character(df$Voltage))
gap <- as.numeric(as.character(df$Global_active_power))
Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
datetime <- as.POSIXct(paste(df$Date, df$Time))
sub1 <- as.numeric(as.character(df$Sub_metering_1))
sub2 <- as.numeric(as.character(df$Sub_metering_2))
sub3 <- as.numeric(as.character(df$Sub_metering_3))

# constructing the plot4
# dividing canvas
par(mfrow = c(2,2), mar = c(4,4,2,2))

# plotting first diagram
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")

# plotting 2nd diagram
plot(datetime, Voltage, type="l")

# plotting 3rd diagram
plot(datetime, sub1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sub2, col="red")
lines(datetime, sub3, col="blue")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, bty="n", cex=0.5)

# plotting 4th diagram
plot(datetime, Global_reactive_power, type="l")

# Saving the plot4
dev.copy(png, file="plot4.png")
dev.off()