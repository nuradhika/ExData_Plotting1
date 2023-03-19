
#read file
household <- fread("household_power_consumption.txt",header = TRUE)

#change date format 
household[, Date := as.POSIXct(paste0(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#filter data to get desired dates
Feb_data <-subset(household, Date>= "2007-02-01" & Date < "2007-02-03")

#save the graph
png("plot3.png", width = 480 ,
    height = 480,
    units = "px")
#plotting data 
plot(Feb_data$Date,as.numeric(Feb_data$Sub_metering_1), type="l", xlab= "",ylab="Energy Sub Metering")
lines(Feb_data$Date,as.numeric(Feb_data$Sub_metering_2), col="red")
lines(Feb_data$Date,as.numeric(Feb_data$Sub_metering_3), col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()