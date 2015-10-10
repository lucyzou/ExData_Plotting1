#read data
hpc<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors = F,header = T)
#convert Date variable into date class 
hpc$Date<-as.Date(hpc$Date, format  ="%d/%m/%Y")
#convert time variable into time class using strptime function
hpc$temptime<-paste(hpc$Date,hpc$Time)
hpc$Time<-strptime(hpc$temptime,format="%Y-%m-%d %H:%M:%S")
#select data from date 2007-02-01 and 2007-02-02
hpcs<-subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")
#draw plot3
png(filename = "plot3.png",width = 480,height = 480)
par(mfrow=c(1,1))
with(hpcs,{
  plot(Time,Sub_metering_1,type = "l",ylab = "Energy Submetering ")
  lines(Time,Sub_metering_2,type = "l",col="red")
  lines(Time,Sub_metering_3,type = "l",col="blue")
  legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
})
dev.off()