plot2 <- function() {
        ds <- read.csv2(file="household_power_consumption.txt", sep=";", na.strings = "?")
        tempDT <- paste(ds$Date, ds$Time)
        ds$DT <- strptime(tempDT, "%d/%m/%Y %H:%M:%S")
        ds2days <- ds[as.Date(ds$DT) >= as.Date("2007-02-01") & as.Date(ds$DT) <= as.Date("2007-02-02"),]
        
        png(file = "plot2.png", width = 480, height = 480)
        plot(ds2days$DT, as.numeric(levels(ds2days$Global_active_power))[ds2days$Global_active_power],
             type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
        dev.off()
}