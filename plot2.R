Pro1 <- read.table("household_power_consumption.txt", stringsAsFactors = F,
                   sep = ";", header = TRUE)

P1 <- Pro1[Pro1$Date == "2/2/2007" | Pro1$Date == "1/2/2007",]

P1$Global_active_power <- as.numeric(P1$Global_active_power)
P1$Ds <- strptime(paste(P1$Date, P1$Time, sep= " "),
                    format = "%d/%m/%Y %H:%M:%S")

# Set x-axis as english
Sys.setlocale("LC_TIME","English")

png("plot2.png",width=480,height=480,units="px")
plot(P1$Ds,P1$Global_active_power,type="n",
     xlab= par(title=NULL),
     ylab= "Global Active Power (kilowatts)",
     main=NULL)
lines(P1$Ds,P1$Global_active_power, col="Black")
title(main = "Global Active Power")
dev.off()