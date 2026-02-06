# plot2.R - Line plot of Global Active Power over time

# Read data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?")

# Create DateTime column by combining Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter dates
subset_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Create PNG
png("plot2.png", width = 480, height = 480)

# Create line plot
plot(subset_data$DateTime, 
     subset_data$Global_active_power,
     type = "l",  # "l" means line
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
print("plot2.png created successfully")
