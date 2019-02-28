##the identity matrix
a=diag(1,2,2)
a
diag(a)
b=matrix(seq(1:4),2,2)
b
dim(b)
c=a%*%b
c
d=b%*%b
d
##determinat of a matrix
det(a)
det(b)
det(d)
####inverse of a matrix
e=solve(b)
e
det(e)
f=e%*%b
f
##eigenvalues and eigenvectors
y<-eigen(b)
y$val
y$vect
### exponetial of a matrix
library(expm)
library(matlab)
g=expm(b)
g
h=expm(a)
h
