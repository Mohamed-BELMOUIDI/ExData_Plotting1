##PLOT 3
#set working directory using setwd()
data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors=FALSE, dec=".", sep = ";", na.strings = "?")
# Convert Date and Time columns to a DateTime class
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# Filter for the dates 2007-02-01 and 2007-02-02
FILTERED_DATA<-subset(data,data$Date%in%c("1/2/2007","2/2/2007"))
## Generating Plot 3
png("plot4.png", width=480, height=480)
plot(FILTERED_DATA$DateTime, FILTERED_DATA$Sub_metering_1, type = "l",xlab = "",ylab = "Energy sub melting")
lines(FILTERED_DATA$DateTime, FILTERED_DATA$Sub_metering_2, col="red")
lines(FILTERED_DATA$DateTime, FILTERED_DATA$Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = "solid")
