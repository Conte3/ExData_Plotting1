#Download the file into mine wd, then oppened it and extracted the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power_consumption.zip")
#Read the file with read.table to state that the na char is the "?"
cons<- read.table("household_power_consumption.txt", sep=";",header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
#Get only the subset that will be used
sub<- subset(cons, (cons$Date == "1/2/2007" | cons$Date== "2/2/2007"))
#Transform the date into POSIX format and creating another column informing the date time.
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")
sub$DateTime <- as.POSIXct(paste(sub$Date,sub$Time))

#create png
png("plot4.png")
#let 4 graphs in the same image
par(mfrow=c(2,2))
#code to the first
plot(sub$DateTime,sub$Global_active_power,ylab = "Global Active Power",xlab = "", type="l")
#code to the second
plot(sub$DateTime,sub$Voltage,ylab = "Voltage",xlab = "datetime", type="l")
#code to the third
plot(sub$DateTime,sub$Sub_metering_1,ylab = "Energy sub Metering",xlab = "", type="l")
points(sub$DateTime,sub$Sub_metering_2, type = "l", col = "red")
points(sub$DateTime,sub$Sub_metering_3, type = "l", col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")

#code to the last but not least
plot(sub$DateTime,sub$Global_reactive_power,ylab = "Global_reactive_power",xlab = "datetime", type="l")

#Finish the connection and create the png file
dev.off()
