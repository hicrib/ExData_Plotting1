#read the data
all <- read.table(file= "hpc.txt" , sep=";" , header = TRUE, quote="", na.strings = "?", colClasses = c("character","character", rep("numeric",'7')) )

#subset two relevant dates 
relev <- subset(x=all, subset = Date == "1/2/2007" | Date == "2/2/2007"  )
#add a timestamp into data for a decent x-axis
total <-within(relev, { timestamp= strptime(paste(Date,Time), format="%d/%m/%Y %H:%M:%S" )})

png (file = "plot1.png",width = 480 ,height = 480 )
#Plot1
with(total, hist(total$Global_active_power, col = "RED" , main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

