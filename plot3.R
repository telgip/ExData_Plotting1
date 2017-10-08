# set the dates 
Date1<-as.Date("2007-02-01")  
Date2<-as.Date("2007-02-02")

#read dataset
dataset <-read.delim("household_power_consumption.txt", sep=";"  )
#coerce date column to date format
dataset$Date <- as.Date( dataset$Date, "%d/%m/%Y")
#subset dataset to dates
subdataset<-subset(dataset, (Date>=Date1) & (Date<=Date2))

#coerce for plotting
subdataset$Time <- strptime(paste(subdataset$Date,subdataset$Time),"%Y-%m-%d %H:%M:%S")
subdataset$Sub_metering_1 <- as.numeric(as.character( subdataset$Sub_metering_1))
subdataset$Sub_metering_2 <- as.numeric( as.character( subdataset$Sub_metering_2))
subdataset$Sub_metering_3 <- as.numeric( as.character( subdataset$Sub_metering_3))

#open png device
png("plot3.png",width=480,height = 480)
#plot (days are Dutch)
plot(subdataset$Time, subdataset$Sub_metering_1, type="l", lwd=2, col="black", ylab="Energy sub metering", xlab="time")
lines(subdataset$Time, subdataset$Sub_metering_2, lwd=2, col="red")
lines(subdataset$Time, subdataset$Sub_metering_3, lwd=2, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(2,2,2), col=c("black","blue","red"))
#close png device
dev.off()
