#first load in the data. 
# loadfile.R, in the repository with this file, does so
source("loadfile.R")

#graphics device opened with transparent background to try
#   and match the rubric plot. 
#Note the rubric lists a different width and height than the reference plots

png("plot4.png",width=480,heigh=480,bg="transparent")
par(mfcol=c(2,2))
par(mar=c(5,4,4,2))
#font size set to 12 points, to come close to rubric plot
par(ps=12)

#first plot (similar to plot2 in assignment)
plot(tidy$timestamp,tidy$Global_active_power,type="n",
       xlab="",ylab="Global Active Power")
lines(tidy$timestamp,tidy$Global_active_power,type="l")


#second plot (similar to plot3 in assignment, with a notable difference
#              being the lack of an outline around the legend )
par(ps=12)
plot(tidy$timestamp,tidy$Sub_metering_1,type="n", xlab="",
        col='red', ylab="Energy sub metering")
lines(tidy$timestamp,tidy$Sub_metering_1,col='black')
lines(tidy$timestamp,tidy$Sub_metering_2,col='red')
lines(tidy$timestamp,tidy$Sub_metering_3,col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        col=c("black","red","blue"),lty=1,bty="n")

#third plot new
plot(tidy$timestamp,tidy$Voltage,typ="n",xlab="datetime",ylab="Voltage")
lines(tidy$timestamp,tidy$Voltage,typ="l")

#fourth plot new
plot(tidy$timestamp,tidy$Global_reactive_power,typ="n",
        xlab="datetime",ylab="Global_reactive_power")
lines(tidy$timestamp,tidy$Global_reactive_power,typ="l")
#print("fourth plot done")

#and finally the fourth plot
dev.off()
