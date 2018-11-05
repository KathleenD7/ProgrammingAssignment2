##reading in and cleaning data
library(pryr)
hpowerconsump <- read.csv("~/Documents/household_power_consumption.txt", header=FALSE, sep=";")
hpowerconsump$fulltime <- paste(hpowerconsump$V1,hpowerconsump$V2)
hpowerconsump$fulltime<-strptime(hpowerconsump$fulltime,format="%d/%m/%Y %H:%M:%S")
colnames(hpowerconsump) <- c("Date", "Time","Global_active_power","Global_Reactive_Power","Voltage","Global_Intensity", "Sub_Metering_1","Sub_Metering_2","Sub_Metering_3","Date_Time")
hpowerconsump<-hpowerconsump[-c(1), ]
objectsize<-object_size(hpowerconsump)
print(objectsize)
badsubsetpower<-hpowerconsump[hpowerconsump$Date_Time >= "2007-02-01" & hpowerconsump$Date_Time <"2007-02-03",]
subsetpower<-badsubsetpower[1:2880,]
subsetpower[,3] <- as.numeric(as.character(subsetpower[,3]))
subsetpower[,7] <- as.numeric(as.character(subsetpower[,7]))
subsetpower[,8] <- as.numeric(as.character(subsetpower[,8]))
subsetpower[,9] <- as.numeric(as.character(subsetpower[,9]))
##making the line graph
plot(subsetpower$Date_Time,subsetpower$Sub_Metering_1,type='n',xlab=" ",ylab="Energy sub metering")
lines(subsetpower$Date_Time, subsetpower$Sub_Metering_1, type="l")
lines(subsetpower$Date_Time, subsetpower$Sub_Metering_2, type="l",col="red")
lines(subsetpower$Date_Time, subsetpower$Sub_Metering_3, type="l",col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=.5)
dev.copy(png, file="plot3.png")
png("plot3.png", width = 480, height = 480)
dev.off()