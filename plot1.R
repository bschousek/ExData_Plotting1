source("loadfile.R")
hist(tidy$Global_active_power,col='red',ylab='Frequency',xlab='Global Active Power (kilowatts)',main='Global Active Power')
if (saveplots) {
    dev.copy(png,"plot1.png",width=480,heigh=480)
    dev.off()
}
