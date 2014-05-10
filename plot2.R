source("dataAsDF2.R")
plot2 <- function(dataFile, plotDir){
        df <- data.as.df2(dataFile)
        message("Generating plot...")
        plotFile <- paste(plotDir,"/plot2.png",sep="")
        png(filename=plotFile,width=480,height=480)
        plot(df[,c("datetime","Global_active_power")], 
             type="l",
             main="Global Active Power by Week days", 
             ylab="Global Active Power (kilowatts)")
        dev.off()
        message(paste("Generated plot successfully to", plotFile))
}