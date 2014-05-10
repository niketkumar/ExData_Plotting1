source("dataAsDF2.R")
plot3 <- function(dataFile, plotDir){
        df <- data.as.df2(dataFile)
        message("Generating plot...")
        plotFile <- paste(plotDir,"/plot3.png",sep="")
        png(filename=plotFile,width=480,height=480)
        plot(df[,c("datetime","Sub_metering_1")], type="l", 
             main="Energy sub metering by Week days", 
             ylab="Energy sub metering", col="black")
        points(df[,c("datetime","Sub_metering_2")], type="l", col="red")
        points(df[,c("datetime","Sub_metering_3")], type="l", col="blue")
        legend("topright", 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),
               lty=1)
        dev.off()
        message(paste("Generated plot successfully to", plotFile))
}