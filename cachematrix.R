
#Dipesh surana
makeCacheMatrix <- function(x = matrix()) {
  
  xinv <- NULL # this is where the result of inversion is stored

  set <- function(y) {
    x <<- y
    xinv <<- NULL # it also initialises xinv to null
  }
  
  get <- function() x # return the input matrix
  setInv <- function(inv) xinv <<- inv # set the inversed matrix
  getInv <- function() xinv # return the inversed matrix
  # return a list that contains these functions, so that we can use
  # makeCacheMatrix object like these
  # x <- makeCacheMatrix(testmatrix)
  # x$set(newmatrix) # to change matrix
  # x$get # to get the setted matrix
  # x$setInv # to set the inversed matrix
  # x$getInv # to get the inversed matrix
  list(set = set, get = get,
       setInv = setInv,
       getInv = getInv)
}


cacheSolve <- function(x, ...) {
  m <- x$getInv() # get the inversed matrix from object x
 
  if(!is.null(m)) { # if the inversion result is there
    message("getting cached data")
    return(m) # return the calculated inversion
  }
  data <- x$get() # if not, we do x$get to get the matrix object
  m <- solve(data) # we solve it
  x$setInv(m) # we then set it to the object
  m # return the solved result
}