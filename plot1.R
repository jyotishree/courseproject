#Course Project 1: plot1.R

# loading data from file
    filename <- "household_power_consumption.txt"
    df <- read.table(filename,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")

# convert date and time variables to Date/Time class
    df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
    df$Date <- as.Date(df$Date, "%d/%m/%Y")

# extracting only two days data for the dates 2007-02-01 and 2007-02-02
    dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
    df <- subset(df, Date %in% dates)

#plotting chart
    hist(df$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving chart to file in png format
    dev.copy(png, file="plot1.png", height=480, width=480)
    dev.off()
