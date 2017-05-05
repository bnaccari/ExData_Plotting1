hpc_raw <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings ="?") #Reads file
hpc<- subset(hpc_raw,Date %in% c("1/2/2007","2/2/2007")) #Keep only days needed

Sys.setlocale("LC_TIME", "C") #Change time language of the plot for US

png(filename = "plot2.png", width = 480, height = 480, units = "px") #Create PNG file

hpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "),format="%d/%m/%Y %H:%M:%S") #Correcting Time datatype
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y") #Correcting Date datatype

plot(hpc$Time,hpc$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",col="black", type = "l")

dev.off() #Closing PNG
