#Load and subset data
AllData <- read.csv("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/4. Exploratory Data Analysis/W1/W1 Assignment/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- subset(AllData, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(Datetime)

#Open plot2.png
png("plot2.png", height=480, width=480)

#Create plot
plot(data$Datetime, data$Global_active_power,pch=NA,
       ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Datetime, data$Global_active_power)

#Close PNG file
dev.off()