# Exploratory data analysis: course project 1
library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df_t <- df %>% filter(Global_active_power != "?", Date %in% c("1/2/2007","2/2/2007"))

# plot 2
library(lubridate)

df_t$TimeStamp <- strptime(paste(df_t$Date,df_t$Time, sep = "-"),format = "%d/%m/%Y-%H:%M:%S")
df_t$WeekDay <- wday(df_t$TimeStamp, label = T, abbr = T)

png("plot2.png")
plot(df_t$TimeStamp, df_t$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

