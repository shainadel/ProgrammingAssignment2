## The following Code  provides functions for storing and
## retrieving an Input Matrix, and its calculated Inverse.

makeCacheMatrix <- function(x = matrix()) 
{
	ValInverseCache <- NULL
	set <- function(InVal) 
	{
		Val <<- InVal
		ValInverseCache <<- NULL
	}
	get <- function() 
	{
		Val
	}
	setinverse <- function(inv_) 
	{
		ValInverseCache <<- inv_
	}
	getinverse <- function() 
	{
		ValInverseCache
	}
	list(set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)
}


## The following Code Inverts the input matrix and returns it from the cache, provided it exists.

cacheSolve <- function(x, ...) 
{
	ValInverse <- Val$getinverse()
	if(is.null(ValInverse)) 
	{
		data <- x$get()
		ValInverse <- solve(data, ...)
		Val$setinverse(ValInverse)
	} 
	else
		message("Using cached data")
	return(ValInverse)
}
