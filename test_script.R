r <- 1000
min <- -10000
max <- 10000
mat <- matrix(runif(r^2, min = min, max = max), r)
l <- makeCacheMatrix(mat)

is.null(l$getinverse()) # TRUE the first time

s <- sum(colSums(cacheSolve(l) %*% l$get()))
all.equal(s, r) # This should be TRUE.
# If you run it twice you should get the same result and it should read
# "getting cached data" in the console

is.null(l$getinverse()) # FALSE the second time

# Here we can check that R is saving computation time
l <- makeCacheMatrix(mat)
system.time(cacheSolve(l)) # Around 4.6 seconds the first time
system.time(cacheSolve(l)) # 0 seconds the second time