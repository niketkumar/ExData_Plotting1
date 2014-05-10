source("dataAsDF2.R")
plot4 <- function(dataFile, plotDir){
        df <- data.as.df2(dataFile)
        message("Generating plot...")
        plotFile <- paste(plotDir,"/plot4.png",sep="")
        png(filename=plotFile,width=480,height=480)
        par(mfrow=c(2,2))
        
        plot(df[,c("datetime","Global_active_power")], 
             type="l",
             main="", 
             ylab="Global Active Power")
        
        plot(df[,c("datetime","Voltage")], 
             type="l",
             main="", 
             ylab="Voltage")
        
        plot(df[,c("datetime","Sub_metering_1")], type="l", 
             main="", 
             ylab="Energy sub metering", col="black")
        points(df[,c("datetime","Sub_metering_2")], type="l", col="red")
        points(df[,c("datetime","Sub_metering_3")], type="l", col="blue")
        legend("topright", 
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"),
               lty=1)
        
        plot(df[,c("datetime","Global_reactive_power")], 
             type="l",
             main="", 
             ylab="Global Reactive Power")
        
        dev.off()
        message(paste("Generated plot successfully to", plotFile))
}