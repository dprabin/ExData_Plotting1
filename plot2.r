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
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()