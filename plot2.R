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

#Plot the Global_active_power vs. POSIXct date-time
plot(subData$Global_active_power~subData$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Export and save plot as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()