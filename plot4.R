library(dplyr)
#setwd("/path/to/project1.data")

# data from 01/02/2007 to 02/02/2007 include 2880 minute-observations starting from line 66638 to line 69517
proj1data<-read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.string="?")

# get nine variable names from the header (1st line of data file) then assign to proj1data
proj1hdrs<-read.table("household_power_consumption.txt",header=TRUE,nrow=1,skip=0,sep=";")
colnames(proj1data)<-colnames(proj1hdrs)

par(mfrow=c(2,2))

# Plot 2 in (1,1)
plot(1:2880,proj1data$Global_active_power,ylab="Global active powe",type="l",xlab="",cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",axes=FALSE,frame.plot=TRUE)
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
axis(2,c(0,2,4,6),c("0","2","4","6"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))

# Voltage vs. datetime
plot(1:2880,proj1data$Voltage,ylab="Voltage",xlab="datetime",type="l",cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",axes=FALSE,frame.plot=TRUE)
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
axis(2,c(234,238,242,246),c("234","238","242","246"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))

# Plot 3 in (2,1)
with(proj1data,plot(1:2880,proj1data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",lty=1,col="black",axes=FALSE,cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",frame.plot=TRUE))
with(proj1data,lines(1:2880,proj1data$Sub_metering_2,type="l",lty=1,col="red"),cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",)
with(proj1data,lines(1:2880,proj1data$Sub_metering_3,type="l",lty=1,col="blue"),cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",)
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
axis(2,c(0,10,20,30),c("0","10","20","30"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
legend(1300,38,lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),box.lty=0,cex=0.50,y.intersp=1.20,xjust=0)

# Global_reactive_power vs. datettime
plot(1:2880,proj1data$Global_reactive_power,ylab="Globa_reactive_power",xlab="datetime",type="l",cex.lab=0.70,cex.axis=0.70,cex.main=0.80,family="Hershey",axes=FALSE,frame.plot=TRUE)
axis(1,c(1,1440,2880),c("Thu","Fri","Sat"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))
axis(2,c(0,0.10,0.20,0.30,0.40,0.50),c("0.0","0.1","0.2","0.3","0.4","0.5"),cex.axis=0.70,family="Hershey",mgp=c(0,1,0))

# output plot to plot4.png
dev.set(3)
dev.copy(png,file="plot4.png")
dev.off()

