#Download the file into mine wd, then oppened it and extracted the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","power_consumption.zip")
#Read the file with read.table to state that the na char is the "?"
cons<- read.table("household_power_consumption.txt", sep=";",header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
#Get only the subset that will be used
sub<- subset(cons, (cons$Date == "1/2/2007" | cons$Date== "2/2/2007"))
#Transform the date into POSIX format
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

#create png
png("plot1.png")
#code to the Histogram
hist(sub$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)", col = "red")
#Finish the connection and create the png file
dev.off()
