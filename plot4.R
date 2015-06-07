##First we load the data table to R (house) with the assumption that 
##the source file is located in the working directory
house <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
##Then we subset the house data frame to work only with the data
##regard to the first and second of february 2007
house1 <- house[house$Date == "1/2/2007" | house$Date == "2/2/2007",]
##To convert the time data, we merge the variables "Date" and "Time
##from the data set and add a new column (datetime)
house1$datetime <- paste(house1$Date, house1$Time, sep = " ")
##Here we convert the time information to the time class
house1$datetime <- strptime(house1$datetime, format = "%d/%m/%Y %H:%M:%S")
#For convinience here we save the data for Global active power and
##datetime to new variables
x <- house1$datetime
z <- house1$Global_active_power
##We open png graphic device to plot the Global active power over
##datetime
png(file = "plot4.png")
par(mfrow = c(2,2), mar = c(2,4,1,2))
plot(x,z, type = "l", xlab = "", ylab = "", cex.axis = 0.7)
mtext("Global Active Power (kilowatts)", side = 2, line = 2.5, cex = 0.75)
#For convinience here we save the data for Voltage and
##datetime to new variables
n <- house1$Voltage

plot(x,n, type = "l", xlab = "", ylab = "", cex.axis = 0.7)
mtext("Voltage", side = 2, line = 2.5, cex = 0.75)
#For convinience here we save the data for Sub-metering and
##datetime to new variables
y1 <- house1$Sub_metering_1
y2 <- house1$Sub_metering_2
y3 <- house1$Sub_metering_3

plot(x,y1, type = "l", xlab = "", ylab = "",cex.axis = 0.7)
lines(x,y2, col = "red")
lines(x,y3, col = "blue")
legend("topright", pch = c(NA,NA,NA), lwd = 1, lty = c(1,1,1),
col = c("black", "red", "blue"), legend = c("Sub_metering_1",
"Sub_metering_2", "Sub_metering_3"), cex = 0.4)
mtext("Energy sub metering", side = 2, line = 2.5, cex = 0.75)
#For convinience here we save the data for Global reactive power and
##datetime to new variables
m <- house1$Global_reactive_power
plot(x,m, type = "l", xlab = "", ylab = "", cex.axis = 0.7)
mtext("Global reactive power", side = 2, line = 2.5, cex = 0.75)

dev.off()
