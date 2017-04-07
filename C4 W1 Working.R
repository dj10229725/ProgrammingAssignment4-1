
setwd("C:/Users/David/Desktop/Coursera/C4 Assignment")
data<-read.table("household_power_consumption.txt",header = TRUE,sep = ";")


data2<-subset(data,Date %in% c("1/2/2007","2/2/2007"))


data3<- data.frame(
Date    = as.Date(data2$Date,"%d/%m/%Y")
,Time   =  strptime(as.character(data2$Time),"%H:%M:%S")
,DateTime   =  strptime(paste(data2$Date, as.character(data2$Time)),"%d/%m/%Y %H:%M:%S")
,Global_active_power   =as.numeric(as.character(data2$Global_active_power))
,Global_reactive_power =as.numeric(as.character(data2$Global_reactive_power))
,Voltage               =as.numeric(as.character(data2$Voltage))
,Global_intensity      =as.numeric(as.character(data2$Global_intensity))
,Sub_metering_1        =as.numeric(as.character(data2$Sub_metering_1))
,Sub_metering_2        =as.numeric(as.character(data2$Sub_metering_2))
,Sub_metering_3        =as.numeric(as.character(data2$Sub_metering_3))
)

par(mfrow=c(1,1))
#Plot 1
hist(data3$Global_active_power
        ,col="red"
        ,main = "Global Active Power"
        ,xlab = "Golbal Active Power (kilowatts)"
        ,xlim = c(0,6)
)


#Plot 2
plot(data3$DateTime,data3$Global_active_power,type = "n"
     ,xlab = "",ylab = "Golbal Active Power (kilowatts)")
lines(data3$Global_active_power~data3$DateTime,lwd=1)

#Plot 3
plot(data3$DateTime,data3$Sub_metering_2,type = "n"
     ,xlab = "",ylab = "Energy sub metering"
     ,ylim = c(0,40))
lines(data3$Sub_metering_1~data3$DateTime,lwd=1,col = "black")
lines(data3$Sub_metering_2~data3$DateTime,lwd=1,col="red")
lines(data3$Sub_metering_3~data3$DateTime,lwd=1,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1.1))


#Plot 4
par(mfrow=c(2,2))

plot(data3$DateTime,data3$Global_active_power,type = "n"
     ,xlab = "",ylab = "Golbal Active Power")
lines(data3$Global_active_power~data3$DateTime,lwd=1)

plot(data3$DateTime,data3$Voltage,type= "n"
     ,xlab="datetime",ylab="Voltage")
lines(data3$Voltage~data3$DateTime,lwd=1)

plot(data3$DateTime,data3$Sub_metering_2,type = "n"
     ,xlab = "",ylab = "Energy sub metering"
     ,ylim = c(0,40))
lines(data3$Sub_metering_1~data3$DateTime,lwd=1,col = "black")
lines(data3$Sub_metering_2~data3$DateTime,lwd=1,col="red")
lines(data3$Sub_metering_3~data3$DateTime,lwd=1,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1.1),cex=0.55)


plot(data3$DateTime,data3$Global_reactive_power,type = "n"
     ,xlab = "",ylab = "Global_reactive_power")
lines(data3$Global_reactive_power~data3$DateTime,lwd=1)




