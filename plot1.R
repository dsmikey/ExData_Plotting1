
epc <- read.table(file.choose(),  header=T, sep=";")

epc$Date <- as.Date(epc$Date, format = "%d/%m/%Y")

epchead <- head(epc)
epchead

epc2007 <- subset(epc, epc$Date >= as.Date("2007-02-01") & epc$Date <= as.Date("2007-02-02"))

str(epc2007)

epc2007$Global_active_power <- as.numeric(as.character(epc2007$Global_active_power))
epc2007$Sub_metering_1 <- as.numeric(as.character(epc2007$Sub_metering_1))
epc2007$Sub_metering_2 <- as.numeric(as.character(epc2007$Sub_metering_2))
epc2007$Sub_metering_3 <- as.numeric(as.character(epc2007$Sub_metering_3))


head(epc2007)

epc2007$DateTime <- strptime(paste(epc2007$Date,epc2007$Time), "%Y-%m-%d %H:%M:%S")
