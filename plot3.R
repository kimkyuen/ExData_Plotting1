#Load and subset data
AllData <- read.csv("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/4. Exploratory Data Analysis/W1/W1 Assignment/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- subset(AllData, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Open plot3.png
png("plot3.png", height=480, width=480)

#Create plot
plot(data$Datetime, data$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(data$Datetime, data$Sub_metering_1)
lines(data$Datetime, data$Sub_metering_2, col='red')
lines(data$Datetime, data$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),col = c('black', 'red', 'blue'))

#Close PNG file
dev.off()