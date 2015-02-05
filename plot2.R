# Loading power consumption data of date between 2007-02-01 and 2007-02-02
ds <- read.table("household_power_consumption.txt", header=T, sep=";")
df <- power[(ds$Date=="1/2/2007") | (ds$Date=="2/2/2007"),]

# Converting and extraction global active power into numberic format
active_power <- as.numeric(as.character(df$Global_active_power))

timstm <- as.POSIXct(paste(df$Date, df$Time))

# constructing the plot2
plot(timstm, active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Saving the plot2
dev.copy(png, file="plot2.png")
dev.off()