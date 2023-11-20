# Exploratory data analysis: course project 1
library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df_t <- df %>% filter(Global_active_power != "?", Date %in% c("1/2/2007","2/2/2007"))

library(lubridate)

df_t$TimeStamp <- strptime(paste(df_t$Date,df_t$Time, sep = "-"),format = "%d/%m/%Y-%H:%M:%S")
df_t$WeekDay <- wday(df_t$TimeStamp, label = T, abbr = T)

# plot 4
png("plot4.png")
par(mfrow = c(2,2))
plot(df_t$TimeStamp, df_t$Global_active_power, type = "l",  xlab = "", ylab = "Global Active Power (kilowatts)")
plot(df_t$TimeStamp, df_t$Voltage, type = "l",  xlab = "", ylab = "Voltage")

plot(df_t$TimeStamp, df_t$Sub_metering_1, col = "black", type = "l",  xlab = "", ylab = "Energy sub metering")
lines(df_t$TimeStamp, df_t$Sub_metering_2, col = "red", type = "l")
lines(df_t$TimeStamp, df_t$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black","red","blue"), lty = 1, bty = "n", cex = 0.8)

plot(df_t$TimeStamp, df_t$Global_reactive_power, type = "l",  xlab = "", ylab = "Global_reactive_power")
dev.off()