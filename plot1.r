#this block of code downloads the file from internet
#it is commented because it is already downloaded and 
#downloading takes a lot of time
#if(!file.exists("household_power_consumption.txt")){
    #fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    #download.file(fileurl,destfile="household_power_consumption.txt",method="curl")
    #list.files()
    #dateDownloaded<-date()
#}

#read teh downloaded datafile with read.table()
#important parameters: file, header, sep, row.names,nrows
setwd("~/Movies/coursera/04 Exploratory Data Analysis/Projects")
## Getting full dataset
pwr<-read.table("household_power_consumption.txt",header=T,sep=";",check.names = F,nrows=2075259,na.strings="?",comment.char="",quote="\"")
#Change string type to date type
pwr$Date <- as.Date(pwr$Date, format="%d/%m/%Y")
# Subsetting the data
data <- subset(pwr, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#Remove power data from memory
rm(pwr)
#Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Now Plotting
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()