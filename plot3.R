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
png(filename = "plot3.png")
with(hpc, {
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
  
})
legend("topright", 
       col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty = c("solid","solid","solid"))
dev.off()
