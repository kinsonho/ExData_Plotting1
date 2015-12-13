plot3 <- function() {
        ds <- read.csv2(file="household_power_consumption.txt", sep=";", na.strings = "?")
        tempDT <- paste(ds$Date, ds$Time)
        ds$DT <- strptime(tempDT, "%d/%m/%Y %H:%M:%S")
        ds2days <- ds[as.Date(ds$DT) >= as.Date("2007-02-01") & as.Date(ds$DT) <= as.Date("2007-02-02"),]
        
        png(file = "plot3.png", width = 480, height = 480)
        with(ds2days, plot(DT, as.numeric(levels(Sub_metering_1))[Sub_metering_1],
             type = "l", xlab = "", ylab = "Energy sub metering", col = "black"))
        with(ds2days, points(DT, as.numeric(levels(Sub_metering_2))[Sub_metering_2],
             type = "l", col = "red"))
        with(ds2days, points(DT, as.numeric(levels(Sub_metering_3))[Sub_metering_3],
             type = "l", col = "blue"))
        legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        dev.off()
}