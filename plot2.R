file <- read.table("household_power_consumption.txt",sep=";",header=T)
subdata<-subset(file,file$Date=="1/2/2007"|file$Date=="2/2/2007")
####Plot2####
png("plot2.png")
subdata$Date<-as.Date(subdata$Date,format = "%d/%m/%Y")
subdata$Time<-strptime(subdata$Time,format = "%H:%M:%S")
a<-subdata$Date=="2007-02-01"
sum(a)
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
plot(subdata$Time,as.numeric(subdata$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)")
title(main="Global Active Power Vs Time")
dev.off()
