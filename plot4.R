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
subdataset$Sub_metering_1 <- as.numeric( as.character( subdataset$Sub_metering_1))
subdataset$Sub_metering_2 <- as.numeric( as.character( subdataset$Sub_metering_2))
subdataset$Sub_metering_3 <- as.numeric( as.character( subdataset$Sub_metering_3))

subdataset$Global_active_power <- as.numeric( as.character( subdataset$Global_active_power))

subdataset$Global_reactive_power <- as.numeric( as.character( subdataset$Global_reactive_power))

subdataset$Voltage <- as.numeric( as.character( subdataset$Voltage))

#open png device
png("plot4.png",width=480,height = 480)

#create 2x2 matrix which renders each plot in a cell
par(mfrow=c(2,2))
with(subdataset,{

#plots
  plot(Time, Global_active_power, type="l", lwd=1, col="black", ylab="Global Active Power", xlab="")
  
  plot(Time, Voltage, type="l", lwd=1, col="black", ylab="Voltage", xlab="datetime")
  
  plot(subdataset$Time, subdataset$Sub_metering_1, type="l", lwd=2, col="black", ylab="Energy sub metering", xlab="")
  lines(subdataset$Time, subdataset$Sub_metering_2, lwd=1, col="red")
  lines(subdataset$Time, subdataset$Sub_metering_3, lwd=1, col="blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=c(1,1,1), col=c("black","blue","red"))
  
  plot(Time, Global_reactive_power, type="l", lwd=1, col="black", ylab="Global_reactive_power", xlab="datetime")
})

#close png device
dev.off()
