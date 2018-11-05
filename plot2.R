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
##making the line graph
plot(subsetpower$Date_Time,subsetpower$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
png("plot2.png", width = 480, height = 480)
dev.off()