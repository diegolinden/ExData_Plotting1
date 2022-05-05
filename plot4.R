file <- read.table("household_power_consumption.txt",sep=";",header=T)
subdata<-subset(file,file$Date=="1/2/2007"|file$Date=="2/2/2007")
####Plot4####
subdata$Date<-as.Date(subdata$Date,format = "%d/%m/%Y")
subdata$Time<-strptime(subdata$Time,format = "%H:%M:%S")
a<-subdata$Date=="2007-02-01"
sum(a)
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))
#1
plot(subdata$Time,subdata$Global_active_power,type="l",ylab="Global Active Power",xlab="")
#2
plot(subdata$Time,subdata$Voltage,type="l",ylab="Voltage",xlab="")
#3
plot(subdata$Time,subdata$Sub_metering_1,type="n",ylab="Energy sub metering")
with(subdata,lines(Time,as.numeric(Sub_metering_1)))
with(subdata,lines(Time,as.numeric(Sub_metering_2),col="red"))
with(subdata,lines(Time,as.numeric(Sub_metering_3),col="blue"))
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#4
plot(subdata$Time,subdata$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="l")
dev.off()

