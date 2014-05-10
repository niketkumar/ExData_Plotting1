data.as.df2 <- function(file){
        message("Loading data, please wait...")
        df <- read.csv(file, colClasses=c(rep("character",2),rep("numeric",7)), 
                           header=T,
                           na.strings="?", 
                           sep=";")
        message("Data loaded successfully")
        df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
        df$datetime <- paste(df$Date, df$Time)
        df$datetime <- strptime(df$datetime, tz="", format="%d/%m/%Y %H:%M:%S")
        df$dDate <- strptime(df$Date, tz="", format="%d/%m/%Y")
        #df$Time <- strptime(df$Time, tz="", format="%H:%M:%S")
        df$wday <- factor(weekdays(df$dDate, abbreviate=T), levels=c("Sun","Mon","Tue","Wed","Thu","Fri","Sat"))
        df
}