## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix:

## This function creates a special "matrix" object that can cache its 
## inverse.

makeCacheMatrix <- function(x = matrix()) 
{
  xinv <- matrix()
  ## set:
  ## This function Store raw matrix
  set <- function(m)
  {
    x <<- m
    xinv <<- NULL
  }
  ## get:
  ## This function Retrieves raw matrix
  get <- function() x
  ## setinverse:
  ## This function Store inverse matrix
  setinverse <- function(minv) xinv <<- minv
  ## getinverse:
  ## This function Retreive inverse matrix
  getinverse <- function() minv
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## cacheSolve:

## This function computes the inverse of the special "matrix" returned 
## by makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve should retrieve the 
## inverse from the cache.

cacheSolve <- function(x, ...) 
{
  ## Return a matrix that is the inverse of 'x'
  minv <- x$getinverse()
  
  if(!is.null(minv))
  {
    message("Getting cache data")
    return(minv)
  }
  
  m <- x$get()
  minv <- solve(m,...)
  x$setinverse(minv)
  minv
}
