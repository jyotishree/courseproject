#Course Project 1: plot4.R

# loading data from file
    filename <- "d:/household_power_consumption.txt"
    df <- read.table(filename,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

# convert date and time variables to Date/Time class
    df$Date <- as.Date(df$Date, "%d/%m/%Y")

# extracting only two days data for the dates 2007-02-01 and 2007-02-02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)

# Converting dates
    datetime <- paste(as.Date(df$Date), df$Time)
    df$Datetime <- as.POSIXct(datetime)

# Plotting chart
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    with(df, {
        plot(Global_active_power~Datetime, type="l",ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
    })
    
# Saving chart to file in png format
    dev.copy(png, file="plot2.png", height=480, width=480)
    dev.off()