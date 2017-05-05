hpc_raw <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings ="?") #Reads file
hpc<- subset(hpc_raw,Date %in% c("1/2/2007","2/2/2007")) #Keep only days needed

Sys.setlocale("LC_TIME", "C") #Change time language of the plot for US

png(filename = "plot4.png", width = 480, height = 480, units = "px") #Create PNG file

hpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "),format="%d/%m/%Y %H:%M:%S") #Correcting Time datatype
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y") #Correcting Date datatype

par(mfcol=c(2,2)) #Prepare 4 plots

plot(hpc$Time,hpc$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",col="black", type = "l")

plot(hpc$Time,hpc$Sub_metering_1,xlab="",ylab="Energy sub metering",col="black", type = "l")
lines(hpc$Time,hpc$Sub_metering_2,xlab="",col="red")
lines(hpc$Time,hpc$Sub_metering_3,xlab="",col="blue")
legend("topright",legend=names(hpc[7:9]),lty=c(1,1,1),col=c("black","red","blue"))

plot(hpc$Time,hpc$Voltage,xlab="datetime",ylab="Voltage",col="black", type = "l")
plot(hpc$Time,hpc$Global_reactive_power,xlab="datetime",ylab=paste("Global_reactive_power"),col="black", type = "l")

dev.off() #Closing PNG
