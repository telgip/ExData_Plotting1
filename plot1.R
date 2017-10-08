# set the dates 
Date1<-as.Date("2007-02-01")  
Date2<-as.Date("2007-02-02")

# read dataset
dataset <-read.delim("household_power_consumption.txt", sep=";"  )

#coerce date column to date format
dataset$Date <- as.Date( dataset$Date, "%d/%m/%Y")

#subset dataset to dates
subdataset<-subset(dataset, (Date>=Date1) & (Date<=Date2))

#coerce for plotting
subdataset$Date <- as.Date( subdataset$Date, "%d/%m/%Y")
subdataset$Global_active_power <- as.character( subdataset$Global_active_power)
subdataset$Global_active_power <- as.numeric( subdataset$Global_active_power)

#open png device
png("plot1.png",width=480,height = 480)
#plot histogram
hist(subdataset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", ylab="Frequency",main = "Global Active Power")
#close png device
dev.off()
