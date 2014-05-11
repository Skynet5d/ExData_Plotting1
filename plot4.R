hpc <- read.table(file = "household_power_consumption.txt", 
                  header=TRUE,
                  sep = ";", 
                  skip = 66637,
                  col.names=c("Date","Time","GAP","GRP",
                              "Voltage","GI","SM1","SM2","SM3"),
                  nrows = 2880)

hpc$DateTime<-strptime(paste(hpc$Date, hpc$Time), 
                       format="%d/%m/%Y %H:%M:%S")
library(datasets)
png(filename = "plot4.png")
par(mfrow = c(2, 2))
with(hpc, {
  plot(hpc$DateTime,hpc$GAP,
       type="l",
       xlab="",
       ylab="Global Active Power")
  
  plot(hpc$DateTime,hpc$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  plot(hpc$DateTime,hpc$SM1,
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(hpc$DateTime,hpc$SM2,
        type="l",
        xlab="",
        ylab="",
        col="red")
  lines(hpc$DateTime,hpc$SM3,
        type="l",
        xlab="",
        ylab="",
        col="blue")  
  legend("topright", bty="n",
         col = c("black","blue", "red"), 
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
         lty = c("solid","solid","solid"))
  plot(hpc$DateTime,hpc$GRP,
       type="l",
       xlab="",
       ylab="Global_reactive_power")
  
})

dev.off()
