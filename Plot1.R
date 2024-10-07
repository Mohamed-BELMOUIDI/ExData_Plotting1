##PLOT 1
# Read in data with read.table
#set working directory using setwd()
data <- read.table("household_power_consumption.txt",header = T,stringsAsFactors=FALSE, dec=".", sep = ";", na.strings = "?")
# Convert Date and Time columns to a DateTime class
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
# Filter for the dates 2007-02-01 and 2007-02-02
FILTERED_DATA<-subset(data,data$Date%in%c("1/2/2007","2/2/2007"))
## Generating Plot 1
png("plot1.png", width=480, height=480)
hist(FILTERED_DATA$Global_active_power,col = "red", xlab="Global active power (Kilowatt)",main = "Global active power")
dev.off()