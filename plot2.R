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
png("plot2.png")
#code to the plot
plot(sub$DateTime,sub$Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "", type="l")
#Finish the connection and create the png file
dev.off()
