#R Source for Plot 2

##read the file to R program
pd2 <- read.table("household_power_consumption.txt", header = TRUE,  sep=";", stringsAsFactors = FALSE, na.strings ="?")

##select only the records in 1/2/2007 and 2/2/2007
pd2 <- pd2[grep("^[1,2]/2/2007", pd2$Date),]

#convert the Date field to date class
pd2$Date <- as.Date(pd2$Date, format = "%d/%m/%Y")

#create a date/time field for the x-axis of graph
pd2$DateTime <- strptime(paste(pd2$Date, pd2$Time ), format="%Y-%m-%d %H:%M:%S")

##draw the line chart of Global Active Power over that 2 days
plot(pd2$DateTime, pd2$Global_active_power, type = "l", ylab ="Global Active Power (kilowatts)", xlab ="")

##copy the graph to png file
dev.copy(png, filename="plot2.png", width=480, height=480)

dev.off()