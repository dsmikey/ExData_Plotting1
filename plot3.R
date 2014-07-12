
# Load data 

tab10rows <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?", nrows = 10)
classes <- sapply(tab10rows, class)
epc <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = classes)

epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")
epc2007 <- subset(epc, epc$Date >= as.Date("2007-02-01") & epc$Date <= as.Date("2007-02-02"))
epc2007$datetime <- strptime(paste(epc2007$Date,epc2007$Time), "%Y-%m-%d %H:%M:%S")

#plot3_complete <- complete.cases(epc2007)
plot_omit <- na.omit(epc2007)
#plot_omitall <- na.omit(subset(epc2007,select=c(Global_active_power)))


# plot3.R produce plot3.png file

png("plot3.png",width=480,height=480,units="px", pointsize=12, bg = "transparent")
#par(mfrow=c(1,1))
#par(mar=c(5.1,4.1,4.1,2.1))


with(plot_omit, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(plot_omit, lines(datetime, Sub_metering_1, type="l"))
with(plot_omit, lines(datetime, Sub_metering_2, type="l",col="red"))
with(plot_omit, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1))


dev.off()

