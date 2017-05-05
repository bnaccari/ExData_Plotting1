hpc_raw <- read.csv("household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,na.strings ="?") #Reads file
hpc<- subset(hpc_raw,Date %in% c("1/2/2007","2/2/2007")) #Keep only days needed

png(filename = "plot1.png", width = 480, height = 480, units = "px")

hpc$Time <- strptime(paste(hpc$Date,hpc$Time,sep=" "),format="%d/%m/%Y %H:%M:%S") #Correcting Time datatype
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y") #Correcting Date datatype

hist(hpc$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")

dev.off()
