##First we load the data table to R (house) with the assumption that 
##the source file is located in the working directory
house <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)
##Then we subset the house data frame to work only with the data
##regard to the first and second of february 2007
house1 <- house[house$Date == "1/2/2007" | house$Date == "2/2/2007",]
##Now we want to save the resulting plot (a histogram) to a .png file (plot1.png)
##so we open the png graphic device. 
png(file = "plot1.png")
hist(as.numeric(house1$Global_active_power)/1000, main = "Global Active Power", xlab = " Global Acitive Power (kilowatts)", col = "red")
dev.off()
##The resulting histogram (Global Active Power) in now saved.

