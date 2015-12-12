library(dplyr)
#setwd("/path/to/project1.data")

# data from 01/02/2007 to 02/02/2007 include 2880 minute-observations starting from line 66638 to line 69517
proj1data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.string="?")

# get nine variable names from the header (1st line of data file) then assign to proj1data
proj1hdrs<-read.table("household_power_consumption.txt",header=TRUE,nrow=1,skip=0,sep=";")
colnames(proj1data)<-colnames(proj1hdrs)

# Plot 3
with(proj1data,plot(1:2880,proj1data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lty=1,col="black",axes=FALSE,cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",frame.plot=TRUE))
with(proj1data,lines(1:2880,proj1data$Sub_metering_2,type="l",lty=1,col="red"),cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",)
with(proj1data,lines(1:2880,proj1data$Sub_metering_3,type="l",lty=1,col="blue"),cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",)
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
axis(2,c(0,10,20,30),c("0","10","20","30"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lty=1,cex=0.70,y.intersp=0.70)

# output plot to plot3.png
dev.set(3)
dev.copy(png,file="plot3.png")
dev.off()
