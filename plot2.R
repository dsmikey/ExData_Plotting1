
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

### Plot2.R produce plot2.png file

png("plot2.png",width=480,height=480,units="px", bg = "transparent")

#par(mfrow=c(1,1))
#par(oma=c(4,2,0,0))

with(plot_omit, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off()

