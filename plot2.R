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
png(filename = "plot2.png")
with(hpc, {
  plot(hpc$DateTime,hpc$GAP,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
})
dev.off()
