## Together the functions will create and cache the mean of an
## already defined matrix, avoiding having to calculate the 
## mean in the global environment repeatedly, which saves time

## The function takes a matrix as an argument and sets up the 
## ability for a new matrix object to cache its inverse 
makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y           
            inv <<- NULL
      }
      get <- function() x      ## gets the matrix from the parent environment
      setinverse <- function(inverse) {
            inv <<- inverse
                  ## takes in an inverse as an argument and
                  ## returns the inv object in the parent environment
      }
            
      getinverse <- function() inv
                 ## returns the inverse to the current environment
      list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
                  ## creates a list and sets the names of the objects
      
}


cacheSolve <- function(x, ...) {
        inv <- x$getinverse()              
        if(!is.null(inv)) {
              message("getting cached data")
              return(inv)
                  ## if the inverse has already been calculated and is 
                  ## cached, return it 
        }
      
      data <- x$get()               ##else get the data and
      inv <- solve(data, ...)     ## cache the inverse
      x$setinverse(inv)
      inv
}
