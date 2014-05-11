#first load in the data. 
# loadfile.R, in the repository with this file, does so
source("loadfile.R")
#graphics device opened with transparent background to try
#   and match the rubric plot. 
png("plot3.png",width=480,height=480,bg="transparent")
par(ps=12)
plot(tidy$timestamp,tidy$Sub_metering_1,type="n",xlab="",col='red',ylab="Energy sub metering")
lines(tidy$timestamp,tidy$Sub_metering_1,col='black')
lines(tidy$timestamp,tidy$Sub_metering_2,col='red')
lines(tidy$timestamp,tidy$Sub_metering_3,col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)


dev.off()

