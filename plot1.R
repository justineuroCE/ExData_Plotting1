library(dplyr)
#setwd("/path/to/project1.data")

# data from 01/02/2007 to 02/02/2007 include 2880 minute-observations starting from line 66638 to line 69517
proj1data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.string="?")

# get nine variable names from the header (1st line of data file) then assign to proj1data
proj1hdrs<-read.table("household_power_consumption.txt",header=TRUE,nrow=1,skip=0,sep=";")
colnames(proj1data)<-colnames(proj1hdrs)

# construct histohram for Plot 1
hist(proj1data$Global_active_power,xlab="Global active power (kilowatts)",col="red",main="Global Active Power",cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey")

# output plot to plot1.png
dev.set(3)
dev.copy(png,file="plot1.png")
dev.off()
