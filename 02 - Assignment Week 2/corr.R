corr <- function(directory, threshold=0)
{
  val  <- 1:332
  m    <- 1
  corr <- numeric()
  for(i in seq_along(val))
  {
    ## COmpleting the file path:
    fileid <- ""
    dir    <- ""
    path   <- ""
    
    fileid <- toString(val[i])
    n <- 0
    while(n <= 3-nchar(fileid) & val[i]<100)
    {
      fileid <- paste("0",fileid,sep="")
      n <- n+1
    }
    dir <- paste(directory,fileid,sep="/")
    fpath <- paste(dir,"csv",sep=".")
    
    ## Importing pollutant data:
    library(readr)
    aux <- read_csv(fpath)
    
    ## Calculating Correlation
    nobs <- sum(complete.cases((aux)))
    if(nobs > threshold)
    {
      corr <- c(corr,cor(as.numeric(aux$sulfate), as.numeric(aux$nitrate),use="complete.obs"))
    }
    
    
    m <- m+1
  }
  
  return (corr)
}