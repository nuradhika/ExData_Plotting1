#read file
household <- fread("household_power_consumption.txt",header = TRUE)

#change date format 
household[, Date := as.POSIXct(paste0(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

#filter data to get desired dates
Feb_data <-subset(household, Date>= "2007-02-01" & Date < "2007-02-03")

#save the graph
png("plot2.png", width = 480 ,
    height = 480,
    units = "px")
#plotting data
plot(Feb_data$Date,as.numeric(Feb_data$Global_active_power), type="l", xlab= "",ylab="Global Active Power (kilowatts)")dev.off()

dev.off()
