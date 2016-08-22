## These two functions work together to cache the inverse of a matrix.

## makeCacheMatrix creates an R object that stores a invertible matrix and its inverse.  
## The function returns a list that functions as well as a way to access the value of the arguement that is fed into the function.
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  
## A list of functions that are named is returned for easy retrieval  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}



## cacheSolve uses the output from makeCacheMatrix to return an inverse matrix by either accessing the result that was alreday calculated
## or calculting the result directly.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x' by utilizing the list output from the makeCacheMatrix function.
## The following few lines of code checks if there is a cache value of the inverse matrix and stores it as m.
## If m is not empty the function retrieves the stored value of m. 
    m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
## If m is empty a variable data is created that retrieves the stored values that were created when makeCacheMatrix was run.
## the matrix arguement of makeCacheMatrix is stored as the data variable by retrieving its value from list returned by .makeCacheMatrix    
  data <- x$get()
## m is the variable that stores the value of the inverse of the arguement matrix by using the solve function.
  m <- solve(data, ...)
# uses the setinverse() function to store the inverse matrix in the parent environment variable m. 
  x$setinverse(m)
# returs m  
  m
}
