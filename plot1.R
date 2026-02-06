# plot1.R - Histogram of Global Active Power
# This script reads power consumption data and creates histogram

# Read the data file
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?")

# Convert Date column to proper format
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter for only Feb 1-2, 2007
subset_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02", ]

# Create PNG file
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(subset_data$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red",
     breaks = 12)

# Close PNG device
dev.off()

# Message to user
print("plot1.png created successfully")
