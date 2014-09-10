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
data<-read.table("../household_power_consumption.txt",header=T,sep=";",na.strings="?")