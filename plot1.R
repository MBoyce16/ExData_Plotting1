#Download file and unzip to working direcotry
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

#Read all data and subestion
powerData <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?")
subData <- powerData[(powerData$Date=="1/2/2007" | powerData$Date=="2/2/2007"),]

#Plot Global_active_power histogram
hist(subData$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Export and save plot as png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()