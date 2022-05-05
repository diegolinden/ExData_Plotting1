file <- read.table("household_power_consumption.txt",sep=";",header=T)
subdata<-subset(file,file$Date=="1/2/2007"|file$Date=="2/2/2007")
####Plot1####
png("plot1.png")
hist(as.numeric(subdata$Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red") 
dev.off()
