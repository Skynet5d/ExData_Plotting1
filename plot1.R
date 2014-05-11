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
png(filename = "plot1.png")
with(hpc, hist(hpc$GAP, col = "red", 
               main = "Global Active Power",
               xlab="Global Active Power (kilowatts)",
               ylab="Frequency"))  ## Create plot on screen device  ## Add a main title
dev.off()  ## Don't forget to close the PNG device!


