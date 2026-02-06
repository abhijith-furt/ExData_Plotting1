# plot4.R - Four panel plot

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
png("plot4.png", width = 480, height = 480)

# Set up 2x2 grid for plots
par(mfrow = c(2, 2))

# --- PLOT 1 (top-left) ---
plot(subset_data$DateTime, subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# --- PLOT 2 (top-right) ---
plot(subset_data$DateTime, subset_data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# --- PLOT 3 (bottom-left) ---
plot(subset_data$DateTime, subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering",
     col = "black")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")  # no box around legend

# --- PLOT 4 (bottom-right) ---
plot(subset_data$DateTime, subset_data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
print("plot4.png created successfully")
