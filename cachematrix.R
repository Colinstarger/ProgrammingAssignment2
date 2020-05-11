## Colin's Cachematrix
## functions do

## Based on the example makeVector
## I think it works, but there is no test suite
## But used one I found in the discussion forum and it seemed to work!

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  message("calculating...")
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
  }
