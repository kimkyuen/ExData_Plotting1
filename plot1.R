#Load and subset data
AllData <- read.csv("/Users/yuenkim/OneDrive - Electrolux/Desktop/Coursera/4. Exploratory Data Analysis/W1/W1 Assignment/household_power_consumption.txt",header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- subset(AllData, Date %in% c("1/2/2007","2/2/2007"))
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Open plot1.png
png("plot1.png", height=480, width=480)

#Plot histogram
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Close PNG file
dev.off()