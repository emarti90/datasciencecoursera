complete <- function(directory,id = 1:332)
{
  result <- data.frame(id=numeric(),nobs=numeric())
  
  val <- id
  m <- 1
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
    
    ## Importing pollutant data:
    library(readr)
    aux <- read_csv(fpath)

    ## Checking Complete Cases
    result[m,1] <- i
    result[m,2] <- sum(complete.cases(aux))
    
    m <- m+1
  }
  
  return (result)
}