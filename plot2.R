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
subdataset$Global_active_power <- as.numeric( as.character( subdataset$Global_active_power))

#open png device
png("plot2.png",width=480,height = 480)
#plot (days are Dutch)
plot(subdataset$Time,subdataset$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)", xlab="",main = "")
#close png device
dev.off()
