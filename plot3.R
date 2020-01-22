Pro1 <- read.table("household_power_consumption.txt", stringsAsFactors = F,
                   sep = ";", header = TRUE)

P1 <- Pro1[Pro1$Date == "2/2/2007" | Pro1$Date == "1/2/2007",]

P1$Ds <- strptime(paste(P1$Date, P1$Time, sep= " "),
                  format = "%d/%m/%Y %H:%M:%S")

# Set x-axis as english
Sys.setlocale("LC_TIME","English")

png("plot3.png",width=480,height=480,units="px")
plot(P1$Ds,P1$Sub_metering_1,type="n",
     xlab= par(title=NULL),
     ylab= "Energy sub metering",
     main=NULL)
with(P1,{
  lines(Ds,Sub_metering_1, col= "black")
  lines(Ds,Sub_metering_2, col = "red")
  lines(Ds,Sub_metering_3, col = "blue")
  legend("topright", lty=1, col = c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2",
                 "Sub_metering_3"))
})
dev.off()