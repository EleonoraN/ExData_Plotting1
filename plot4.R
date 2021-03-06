setwd("/Users/ellaelchik/Documents/studies/r_programming")
data=read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", stringsAsFactors=FALSE)

data$Global_active_power=as.numeric(data$Global_active_power)
data$Global_reactive_power=as.numeric(data$Global_reactive_power)
data$Voltage=as.numeric(data$Voltage)
data$Global_intensity=as.numeric(data$Global_intensity)
data$Sub_metering_1=as.numeric(data$Sub_metering_1)
data$Sub_metering_2=as.numeric(data$Sub_metering_2)
data$Sub_metering_3=as.numeric(data$Sub_metering_3)
data$Date1<-as.Date(data$Date, format="%d/%m/%Y")
data$Time1<-strptime(data$Time, format="%H:%M:%S")
data$Datetime<-as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

subset=subset(data, data$Date1>="2007-02-01" & data$Date1<="2007-02-02")

par(mfrow=c(2,2))

plot(subset$Datetime, subset$Global_active_power,ylab="Global Active Power", xlab="", type="l")

plot(subset$Datetime, subset$Voltage,ylab="Voltage", xlab="datetime", type="l")

plot(subset$Datetime, subset$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", ylim=range(c(subset$Sub_metering_1, subset$Sub_metering_2, subset$Sub_metering_3)))
par(new=TRUE)
plot(subset$Datetime, subset$Sub_metering_2, ylab="", xlab="", type="l", ylim=range(c(subset$Sub_metering_1, subset$Sub_metering_2, subset$Sub_metering_3)), col="red")
par(new=TRUE)
plot(subset$Datetime, subset$Sub_metering_3, ylab="", xlab="", type="l", ylim=range(c(subset$Sub_metering_1, subset$Sub_metering_2, subset$Sub_metering_3)), col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty="n")

plot(subset$Datetime, subset$Global_reactive_power,ylab="Global_reactive_power", xlab="datetime", type="l")