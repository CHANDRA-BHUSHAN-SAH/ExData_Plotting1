# Loading power consumption data of date between 2007-02-01 and 2007-02-02
ds <- read.table("household_power_consumption.txt", header=T, sep=";")
df <- power[(ds$Date=="1/2/2007") | (ds$Date=="2/2/2007"),]

timstm <- as.POSIXct(paste(df$Date, df$Time))
sub1 <- as.numeric(as.character(df$Sub_metering_1))
sub2 <- as.numeric(as.character(df$Sub_metering_2))
sub3 <- as.numeric(as.character(df$Sub_metering_3))

# constructing the plot3
plot(timstm, sub1, type="l", xlab="", ylab="Energy sub metering")
lines(timstm, sub2, col="red")
lines(timstm, sub3, col="blue")
legend("topright",col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

# Saving the plot3
dev.copy(png, file="plot3.png")
dev.off()