#R Source for Plot 3

##read the file to R program
pd3 <- read.table("household_power_consumption.txt", header = TRUE,  sep=";", stringsAsFactors = FALSE, na.strings ="?")

##select only the records in 1/2/2007 and 2/2/2007
pd3 <- pd3[grep("^[1,2]/2/2007", pd3$Date),]

#convert the Date field to date class
pd3$Date <- as.Date(pd3$Date, format = "%d/%m/%Y")

#create a date/time field for the x-axis of graph
pd3$DateTime <- strptime(paste(pd3$Date, pd3$Time ), format="%Y-%m-%d %H:%M:%S")

##draw the line chart of 3 Energy sub metering over that 2 days
with(pd3, {
  plot(DateTime, Sub_metering_1, 
  type = "l", ylab ="Energy sub metering", xlab ="")
  lines(DateTime, Sub_metering_2, col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
})

##draw the legend of the graph
legend("topright", col = c("black", "red", "blue"), 
       lty = 1, lwd =2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

##copy the graph to png file
dev.copy(png, filename="plot3.png", width=480, height=480)

dev.off()