# Find Matrix T
getRT <- function(M,type="T"){
if(length(absorbingStates(M)) == 0) stop("Not Absorbing Matrix")
tm <- M@transitionMatrix
d <- diag(tm)
m <- max(which(d == 1))
n <- length(d)
ifelse(type=="T",
A <- tm[(m+1):n,(m+1):n],
A <- tm[(m+1):n,1:m])
return(A)
}