
#read the data
all <- read.table(file= "hpc.txt" , sep=";" , header = TRUE, quote="", na.strings = "?", colClasses = c("character","character", rep("numeric",'7')) )

#subset two relevant dates 
relev <- subset(x=all, subset = Date == "1/2/2007" | Date == "2/2/2007"  )
#add a timestamp into data for a decent x-axis
total <-within(relev, { timestamp= strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S" )})


png (file = "plot4.png",width = 480 ,height = 480 )
#plot4
par(mfrow = c(2,2))
plot( total$timestamp,total$Global_active_power ,type="l", ylab = "Global Active Power (kilowatts)",xlab = "" )
plot( total$timestamp,total$Voltage ,type="l", ylab = "Voltage",xlab = "datetime" )
plot( total$timestamp,total$Sub_metering_1 ,type="n", ylab = "Energy sub metering", xlab = "")
points(total$timestamp , total$Sub_metering_1,col="black",type="l")
points(total$timestamp , total$Sub_metering_2,col="red",type="l")
points(total$timestamp , total$Sub_metering_3,col="blue",type="l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), pch = "_", col = c("BLACK","RED","BLUE"))
plot( total$timestamp,total$Global_reactive_power ,type="l", ylab = "Global_reactive_power",xlab = "datetime" )

dev.off()

