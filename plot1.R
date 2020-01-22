Pro1 <- read.table("household_power_consumption.txt", stringsAsFactors = F,
                   sep = ";", header = TRUE)

P1 <- Pro1[Pro1$Date == "2/2/2007" | Pro1$Date == "1/2/2007",]

P1$Global_active_power <- as.numeric(P1$Global_active_power)
png("plot1.png",width=480,height=480,units="px")
hist(P1$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab= "Frequency", main=NULL, col="red")
title(main = "Global Active Power")
dev.off()