pollutantmean <- function(directory, pollutant, id=1:332)
{
  poll <- numeric()
  val <- id
  i<-id[1]
  for(i in seq_along(val))
  {
    ## COmpleting the file path:
    fileid <- ""
    dir    <- ""
    path   <- ""
    
    fileid <- toString(val[i])
    n <- 0
    while(n <= 3-nchar(fileid) & (val[i]<100))
    {
      fileid <- paste("0",fileid,sep="")
      n <- n+1
    }
    dir <- paste(directory,fileid,sep="/")
    fpath <- paste(dir,"csv",sep=".")
    
    #print(fpath)
    
    ## Importing pollutant data:
    library(readr)
    polldata <- read_csv(fpath)
    
    ## Selecting the pollutant
    if(pollutant == "sulfate")
    {
      poll<-c(poll,na.omit(polldata$sulfate))
    }
    else
    {
      poll<-c(poll,na.omit(polldata$nitrate))
    }
  }

  mean(as.numeric(poll,na.rm=TRUE))
  
}