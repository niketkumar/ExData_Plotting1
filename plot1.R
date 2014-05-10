source("dataAsDF2.R")
plot1 <- function(dataFile, plotDir){
        d <- data.as.df2(dataFile)
        message("Generating plot...")
        plotFile <- paste(plotDir,"/plot1.png",sep="")
        png(filename=plotFile,width=480,height=480)
        hist(d$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
        message(paste("Generated plot successfully to", plotFile))
}