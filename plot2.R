#read the data
all <- read.table(file= "hpc.txt" , sep=";" , header = TRUE, quote="", na.strings = "?", colClasses = c("character","character", rep("numeric",'7')) )

#subset two relevant dates 
relev <- subset(x=all, subset = Date == "1/2/2007" | Date == "2/2/2007"  )
#add a timestamp into data for a decent x-axis
total <-within(relev, { timestamp= strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S" )})

png (file = "plot2.png",width = 480 ,height = 480 )
#plot2
with(total , plot( total$timestamp,total$Global_active_power ,type="l", ylab = "Global Active Power (kilowatts)",xlab = "" ))

dev.off()
