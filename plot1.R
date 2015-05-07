#R Source for Plot 1

##read the file to R program
pd1 <- read.table("household_power_consumption.txt", header = TRUE,  sep=";")

##select only the records in 1/2/2007 and 2/2/2007
pd1 <- pd1[grep("^[1,2]/2/2007", pd1$Date),]

##remove the ? rows
pd1 <- pd1[f$Global_active_power != "?",]

##convert the factor variable Global_active_power to numeric
pd1$Global_active_power <- as.numeric(as.character(pd1$Global_active_power))

##draw the historgram
hist(pd1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##copy the histogram to png file
dev.copy(png, filename="plot1.png", width=480, height=480)

dev.off()