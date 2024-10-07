##PLOT 4
#set working directory using setwd()
data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors=FALSE, dec=".", sep = ";", na.strings = "?")
# Convert Date and Time columns to a DateTime class
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# Filter for the dates 2007-02-01 and 2007-02-02
FILTERED_DATA<-subset(data,data$Date%in%c("1/2/2007","2/2/2007"))

## Generating Plot 4
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(FILTERED_DATA$DateTime,FILTERED_DATA$Global_active_power,type = "l",xlab = "",ylab = "Global active power")
plot(FILTERED_DATA$DateTime,FILTERED_DATA$Voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(FILTERED_DATA$DateTime, FILTERED_DATA$Sub_metering_1, type = "l",xlab = "datetime",ylab = "Energy sub melting")
lines(FILTERED_DATA$DateTime, FILTERED_DATA$Sub_metering_2, col="red")
lines(FILTERED_DATA$DateTime, FILTERED_DATA$Sub_metering_3, col="blue")
legend("topright",bty = "o",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))
plot(FILTERED_DATA$DateTime, FILTERED_DATA$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()