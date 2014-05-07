library(lubridate)
ftname<-"household_power_consumption_tidy.txt"
fname<-"household_power_consumption.txt"
if (!ftname %in% list.files()) {
  print('creating tidy')
  bigtable<-read.table(fname,sep=";",header=T,na.strings="?")
  bigdates<-dmy(bigtable$Date)
  mindate<-"2007-02-01"
  maxdate<-"2007-02-02"
  interest<-new_interval(ymd(mindate),ymd(maxdate))
  tableindex<- bigdates %within% interest
  tidy<-bigtable[which(tableindex==T),]
  tidy$timestamp<-strptime(paste(tidy$Date,tidy$Time),"%d/%m/%Y %H:%M:%S")
  write.csv(tidy,"household_power_consumption_tidy.txt")
} else {
  print('loading tidy')
  tidy<-read.table(ftname,sep=",",header=T)
}

hist(tidy$Global_active_power,col='red',ylab='Frequency',xlab='Global Active Power (kilowatts)',main='Global Active Power')


plot(tidy$timestamp,tidy$Global_active_power)
