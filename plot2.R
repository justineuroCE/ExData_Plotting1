library(dplyr)
#setwd("/path/to/project1.data")

# data from 01/02/2007 to 02/02/2007 include 2880 minute-observations starting from line 66638 to line 69517
proj1data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.string="?")

# get nine variable names from the header (1st line of data file) then assign to proj1data
proj1hdrs<-read.table("household_power_consumption.txt",header=TRUE,nrow=1,skip=0,sep=";")
colnames(proj1data)<-colnames(proj1hdrs)

# Plot 2
plot(1:2880,proj1data$Global_active_power,ylab="Global active power (kilowatts)",type="l",xlab="",cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",axes=FALSE,frame.plot=TRUE)
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
axis(2,c(0,2,4,6),c("0","2","4","6"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))

# output plot to plot2.png
dev.set(3)
dev.copy(png,file="plot2.png")
dev.off()


