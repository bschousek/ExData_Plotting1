source("loadfile.R")
par()
plot(tidy$timestamp,tidy$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(tidy$timestamp,tidy$Global_active_power,type="l")
if(saveplots) {
    dev.copy(png,"plot2.png",width=480,heigh=480,bg="transparent")
    dev.off()
}