#first load in the data. 
# loadfile.R, in the repository with this file, does so
source("loadfile.R")
#graphics device opened with transparent background to try
#   and match the rubric plot. 
#Note the rubric lists a different width and height than the reference plots

png("plot2.png",,width=480,height=480,bg="transparent")
#font size set to 12 points, to come close to rubric plot
par(ps=12)
plot(tidy$timestamp,tidy$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(tidy$timestamp,tidy$Global_active_power,type="l")
#dev.copy(png,"plot2.png",width=480,height=480,bg="transparent")
dev.off()
