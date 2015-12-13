plot1 <- function() {
        ds <- read.csv2(file="household_power_consumption.txt", sep=";", na.strings = "?")
        tempDT <- paste(ds$Date, ds$Time)
        ds$DT <- strptime(tempDT, "%d/%m/%Y %H:%M:%S")
        ds2days <- ds[as.Date(ds$DT) >= as.Date("2007-02-01") & as.Date(ds$DT) <= as.Date("2007-02-02"),]
        
        png(filename = "plot1.png", width = 480, height = 480)
        hist(as.numeric(levels(ds2days$Global_active_power))[ds2days$Global_active_power],
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)",
             col = "red")
        dev.off()
}