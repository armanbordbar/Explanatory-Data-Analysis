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
y <- house1$Global_active_power
##We open png graphic device to plot the Global active power over
##datetime 
png(file = "plot2.png")
plot(x,y, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()