#read data
household <- fread("household_power_consumption.txt",header = TRUE)

#change date format 
household[, Date := as.POSIXct(paste0(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#filter data to get desired dates
Feb_data <-subset(household, Date>= "2007-02-01" & Date < "2007-02-03")

#save the graph 
png("plot4.png", width = 480 ,
    height = 480,
    units = "px")

#graphs with 2 columns and 2 rows 
par(mfrow= c(2,2))

#plotting data 
plot(Feb_data$Date,as.numeric(Feb_data$Global_active_power), type="l", xlab= "",ylab="Global Active Power")

plot(Feb_data$Date,as.numeric(Feb_data$Voltage), type="l", xlab= "datetime",ylab="Voltage")

plot(Feb_data$Date,as.numeric(Feb_data$Sub_metering_1), type="l", xlab= "",ylab="Energy Sub Metering")
lines(Feb_data$Date,as.numeric(Feb_data$Sub_metering_2), col="red")
lines(Feb_data$Date,as.numeric(Feb_data$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue"))

plot(Feb_data$Date,as.numeric(Feb_data$Global_reactive_power), type="l", xlab= "datetime",ylab="Global_reactive_power")

dev.off()