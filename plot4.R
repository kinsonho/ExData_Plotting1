plot4 <- function() {
        ds <- read.csv2(file="household_power_consumption.txt", sep=";", na.strings = "?")
        tempDT <- paste(ds$Date, ds$Time)
        ds$DT <- strptime(tempDT, "%d/%m/%Y %H:%M:%S")
        ds2days <- ds[as.Date(ds$DT) >= as.Date("2007-02-01") & as.Date(ds$DT) <= as.Date("2007-02-02"),]
        
        
        png(file = "plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
        
        with(ds2days, {
                plot(DT, as.numeric(levels(Global_active_power))[Global_active_power],
                        type = "l", xlab = "", ylab = "Global Active Power")
        
                plot(DT, as.numeric(levels(Voltage))[Voltage],
                        type = "l", xlab = "datetime", ylab = "Voltage")
        
        
                plot(DT, as.numeric(levels(Sub_metering_1))[Sub_metering_1],
                        type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
                points(DT, as.numeric(levels(Sub_metering_2))[Sub_metering_2],
                        type = "l", col = "red")
                points(DT, as.numeric(levels(Sub_metering_3))[Sub_metering_3],
                        type = "l", col = "blue")
                legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
        
        
                plot(DT, as.numeric(levels(Global_reactive_power))[Global_reactive_power],
                        type = "l", xlab = "datetime", ylab = "Global_reactive_power")
        })
        
        dev.off()
}