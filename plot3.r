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
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()