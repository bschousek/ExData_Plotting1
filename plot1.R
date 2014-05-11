#first load in the data. 
# loadfile.R, in the repository with this file, does so
source("loadfile.R")
#graphics device opened with transparent background to try
#   and match the rubric plot. 
#Note the rubric lists a different width and height than the reference plots

png("plot1.png",width=480,height=480,bg="transparent")
#font size set to 12 points, to come close to rubric plot
par(ps=12)
hist(tidy$Global_active_power,col='red',ylab='Frequency',
    xlab='Global Active Power (kilowatts)',main='Global Active Power')

#finally save the plot
dev.off()
