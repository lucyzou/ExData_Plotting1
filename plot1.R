#read data
hpc<-read.table("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors = F,header = T)
#convert Date variable into date class 
hpc$Date<-as.Date(hpc$Date, format  ="%d/%m/%Y")
#convert time variable into time class using strptime function
hpc$temptime<-paste(hpc$Date,hpc$Time)
hpc$Time<-strptime(hpc$temptime,format="%Y-%m-%d %H:%M:%S")
#select data from date 2007-02-01 and 2007-02-02
hpcs<-subset(hpc,Date=="2007-02-01"|Date=="2007-02-02")
#draw plot1
png(filename = "plot1.png",width = 480,height = 480)
par(mfrow=c(1,1))

hist(hpcs$Global_active_power,main = "Global Active Power",xlab = "Global Active Power(kilowatts)",col = "red")
dev.off()