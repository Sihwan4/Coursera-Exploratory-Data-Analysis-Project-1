Pro1 <- read.table("household_power_consumption.txt", stringsAsFactors = F,
                   sep = ";", header = TRUE)

P1 <- Pro1[Pro1$Date == "2/2/2007" | Pro1$Date == "1/2/2007",]

P1$Global_active_power <- as.numeric(P1$Global_active_power)
P1$Ds <- strptime(paste(P1$Date, P1$Time, sep= " "),
                  format = "%d/%m/%Y %H:%M:%S")

# Set x-axis as english
Sys.setlocale("LC_TIME","English")

# save PNG file
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
 with(P1, {
  plot(Ds,Global_active_power,type="n",
       xlab= par(title=NULL),
       ylab= "Global Active Power",
       main=NULL)
  lines(Ds,Global_active_power, col="Black")
     })
with(P1,{
  plot(Ds,Voltage,type="n",xlab="datetime",
       ylab="Voltage",main=NULL)
  lines(Ds,Voltage,col="Black")
})
 
with(P1,{
  plot(Ds,Sub_metering_1,type="n",
       xlab= par(title=NULL),
       ylab= "Energy sub metering",
       main=NULL)
  lines(Ds,Sub_metering_1, col= "black")
  lines(Ds,Sub_metering_2, col = "red")
  lines(Ds,Sub_metering_3, col = "blue")
  legend("topright", lty=1, col = c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3"),
         bty="n")
})

with(P1,{
  plot(Ds,Global_reactive_power,type="n",xlab="datetime",
       ylab="Global_reactive_power",main=NULL)
  lines(Ds,Global_reactive_power)
})
dev.off()