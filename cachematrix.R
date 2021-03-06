##This function calculate the special matrix, stores the matrix, and checks to see if the inverse matrix
##already has been calculate. If it hasn't been calculated, it calculates it
##and if it has, it returns the inverse matrix

##This function creates a special matrix that can cache the inverse matrix

makeCacheMatrix<- function(x=numeric()){
  m<- NULL
  set<- function(y){
    x<<- y
    m<- NULL
  }
  get<- function() x
  setinversematrix<- function(inversematrix) m <<- inversematrix
  getinversematrix<- function() m
  list(set=set, get=get, 
       setinversematrix=setinversematrix,
       getinversematrix=getinversematrix)
}

##This function checks to see if the inverse matrix has already been calculated
##and if it hasn't, it calculates  it. if it has, it returns the value

cacheSolve<- function(x,...){
  m<- x$getinversematrix()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  data<- x$get()
  m<- solve(data)
  x$setinversematrix(m)
}