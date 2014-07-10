#Course Project 1: plot2.R

# loading data from file
    filename <- "household_power_consumption.txt"
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
    plot(df$Global_active_power~df$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# Saving chart to file in png format
    dev.copy(png, file="plot2.png", height=480, width=480)
    dev.off()