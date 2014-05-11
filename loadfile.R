##loadfile.R loads and tidies the dataset.
# It uses some logic to save time:
#  1) If the variable "tidy" already exists in memory, use that
#  2) If the variable doesn't exist, but an already 
#     tidied file exists (whose name is in ftname) then
#     load the already tidied version.
#  3) As a fallback, load and tidy the original dataset
#     (whose name is in fname) then save it to file <ftname>
#     for future use.

#lubridate used for time/date conversions
library(lubridate)
ftname<-"household_power_consumption_tidy.dat"
fname<-"household_power_consumption.txt"

if (!exists("tidy")) {
    if (!ftname %in% list.files()) {
    print('creating tidy')
    bigtable<-read.table(fname,sep=";",header=T,na.strings="?")
    #create a new indexing variable using lubridate
    bigdates<-dmy(bigtable$Date)
    #set up a range of dates we are interested in
    mindate<-"2007-02-01"
    maxdate<-"2007-02-02"
    interest<-new_interval(ymd(mindate),ymd(maxdate))
    #find rows in the original dataset that fall within dates of interest
    tableindex<- bigdates %within% interest
    #create a new subset of the original data with only interesting dates
    tidy<-bigtable[which(tableindex==T),]
    #add a complete timestamp to this tidy dataset
    tidy$timestamp<-strptime(paste(tidy$Date,tidy$Time),"%d/%m/%Y %H:%M:%S")
    #write the tidy dataset out for future use
    save(tidy,file=ftname)
  } else {
    print('loading tidy')
    tidy<-load(ftname)
  }
} else print('tidy already loaded')

