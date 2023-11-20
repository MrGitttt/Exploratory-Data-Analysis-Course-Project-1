# Exploratory data analysis: course project 1
library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df_t <- df %>% filter(Global_active_power != "?", Date %in% c("1/2/2007","2/2/2007"))

# plot 1
gap <- as.double(df_t$Global_active_power)

png("plot1.png")
barplot(table(cut(gap,breaks=seq(0,6,by=0.5))), col = "red", main = "Global Active Power", 
        xlab = "Global Active Power (kilowatts)", ylab = "Frequency", )
par(mar = c(3,4,2,1))
dev.off()
