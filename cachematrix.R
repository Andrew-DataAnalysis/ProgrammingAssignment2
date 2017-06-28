## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    #Reads in the initial matrix and sets up the paramerts to be cached
    
    #This section initialises variables
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    #This initialises the functions
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function() m
    #Assigns the functions to variables in the returned list
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    #Gets the cached version
    m <- x$getsolve()
    
    #If a cached version exists, return it
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    #Otherwise, gets the matrix from the get function, within makeCacheMatrix
    data <- x$get()
    #Performs the inverse calculation
    m <- solve(data, ...)
    x$setsolve(m)
    m
}
