#Download file and unzip to working direcotry
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#Read all data and subestion
powerData <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?")
subData <- powerData[(powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007"),]

#Reformat Date data from string to Date characters, then combine date and time into POSIXct format
subData$Date <- as.Date(subData$Date, format="%d/%m/%Y")
dateTime <- paste(subData$Date, subData$Time)
subData$DateTime <- as.POSIXct(dateTime)

#Setup and plot 2x2 matrix of graphs
par(mfcol=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subData, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

#Export and save plot as png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()