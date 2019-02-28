install.packages("markovchain","diagram","diagrammeR")
require(markovchain)
library(expm)
library(markovchain)
library(diagram)
#Drankward example
p <- c(.5,0,.5)
dw <- c(1,rep(0,4),p,0,0,0,p,0,0,0,p,rep(0,4),1)
DW <- matrix(dw,5,5,byrow=TRUE)
DW
DWmc <-new("markovchain",transitionMatrix = DW,states = c("0","1","2","3","4"),name = "Drunkard's Walk")
DWmc
# Determine transient states
transientStates(DWmc)
# determine absorbing states
absorbingStates(DWmc)  
# Put DWmc into Canonical Form
P <- canonicForm(DWmc)
P
T <- getRT(P)
T
# Find Fundamental Matrix
I <- diag(dim(T)[2])
I
N <- solve(I - T)
N
#Calculate time to absorption
e <- rep(1,dim(N)[2])
m <- N %*% e
m
R <- getRT(P,"R")
R
A <- N %*% R
A