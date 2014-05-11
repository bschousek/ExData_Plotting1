source("loadfile.R")
png("plot1.png",width=480,height=480,bg="transparent")
par(ps=12)
hist(tidy$Global_active_power,col='red',ylab='Frequency',xlab='Global Active Power (kilowatts)',main='Global Active Power')

#dev.copy(png,"plot1.png",width=480,height=480,bg="transparent")
dev.off()
