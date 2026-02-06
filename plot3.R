# plot3.R - Energy sub-metering plot

# Read data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?")

# Create DateTime
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter dates
subset_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Create PNG
png("plot3.png", width = 480, height = 480)

# First line (black)
plot(subset_data$DateTime, subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")

# Second line (red)
lines(subset_data$DateTime, subset_data$Sub_metering_2, 
      col = "red")

# Third line (blue)
lines(subset_data$DateTime, subset_data$Sub_metering_3, 
      col = "blue")

# Add legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)  # lty=1 means solid line

dev.off()
print("plot3.png created successfully")
