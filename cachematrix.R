## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

##please make sure you install 'matlib' package from cran before you test this function
##I have used the inv() function from matlib package which requires installion
##and loading the matlib package
library(matlib)       ##loading matlib package for using inv() functiom 
makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL     
  set <- function(y){   ##setting values
    x <<- y
    inverse <<- NULL
  }
  get <- function() x   ##getting values
  setMatrix <- function(inv) inverse <<- inv  ##setting the inverse of the matrix  
  getMatrix <- function() inverse             ##getting the inverse of the matrix
  ##making a list of all the functions created above
  list(set = set,get = get, setMatrix = setMatrix,getMatrix = getMatrix)

}




## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getMatrix()
        if(!is.null(inverse)){      ##checking if the value of inverse is presesnt in the cache memory
          message("loading cached data")
          return(inverse)           ##returning value of the inverse from cache
        }
        ##if the calculated inverse is not present in the cache memory 
        ##the function below calculates the inverse of the matrix input
        dat <- x$get()              
        inverse <- inv(dat,...)
        x$setMatrix(inverse)
        inverse                     ##returns the calculated inverse
}
