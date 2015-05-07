#R Source for Plot 4

##read the file to R program
pd4 <- read.table("household_power_consumption.txt", header = TRUE,  sep=";", stringsAsFactors = FALSE, na.strings ="?")

##select only the records in 1/2/2007 and 2/2/2007
pd4 <- pd4[grep("^[1,2]/2/2007", pd4$Date),]

##convert the Date field to date class
pd4$Date <- as.Date(pd4$Date, format = "%d/%m/%Y")

##create a date/time field for the x-axis of graph
pd4$DateTime <- strptime(paste(pd4$Date, pd4$Time ), format="%Y-%m-%d %H:%M:%S")

##create a 2x2 drawing spaces
par(mfrow =c(2,2), mar = c(4,4,2,3), oma = c(0,0,2,0))

##draw the 4 charts over that 2 days
with(pd4, {
  
  ##plot the upper left graph
  plot(DateTime, Global_active_power, type = "l", 
       ylab ="Global Active Power (kilowatts)", xlab ="")
  
  ##draw the upper right graph
  plot(DateTime, Voltage, type = "l", 
       ylab ="Voltage", xlab ="datetime")
  
  ##draw the lower left graph
  plot(DateTime, Sub_metering_1, 
  type = "l", ylab ="Energy sub metering", xlab ="")
  lines(DateTime, Sub_metering_2, col = 'Red')
  lines(DateTime, Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), 
         lty = 1, lwd =2, 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
  
  ##draw the lower right graph
  plot(DateTime, Global_reactive_power, type = "l",  xlab ="datetime")
 
  ##copy the graph to png file
  dev.copy(png, filename="plot4.png", width=480, height=480)
  
  dev.off()
  

})



