## Matrix inversion is usually a costly computation and there may be some
## benefit to caching the inverse of a matrix rather than compute it repeatedly.
## This script provides a special "matrix" object, that can cache its inverse
## and a function that checks for an already cached inverse in this special
## matrix, before attempting to inverse it again.

## makeCacheMatrix: This function creates a special "matrix" object that can
## cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL

        set <- function(y) {
                x <<- y
                # reset cache, if matrix changes
                inv <<- NULL
        }

        get <- function() x

        setInverse <- function(inverse) inv <<- inverse

        getInverse <- function() inv

        list(
                set = set,
                get = get,
                setInverse = setInverse,
                getInverse = getInverse
        )
}


## cacheSolve: This function computes the inverse of the special "matrix"
## returned by makeCacheMatrix above. If the inverse has already been calculated
## (and the matrix has not changed), then the cacheSolve should retrieve the
## inverse from the cache.

cacheSolve <- function(x, ...) {
        inv <- x$getInverse()

        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }

        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)

        inv
}
