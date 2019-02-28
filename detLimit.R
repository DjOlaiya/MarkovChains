#testing lim of dterminant
install.packages("markovchain","diagram","diagrammeR")
require(markovchain)
library(DiagrammeR)
library(diagram)
library(matrixcalc)
matval<-c(.3,.7,.12,.88)
limtest<-matrix(matval,nrow = 2, ncol = 2)
det(limtest)

for(i in 1){
  pow<-limtest^i
  d<-det(pow)
  for(j in i) {
    print(pow)
    print(d)
}
}
powers<-c(1:3)
for(q in powers){
  for(w in powers){
    limtest^w
    det(limtest^w)
  }
}

####with mc package

teststates <- c( "nice", "snow")
byRow <- TRUE
weatherMatrix <- matrix(data = c(0.50, 0.25, 0.25,0.5, 0, 0.5,0.25,0.25, 0.5), byrow = byRow, nrow = 3,dimnames = list(weatherStates, weatherStates))
mcTest <- new("markovchain", states = teststates, byrow = byRow,transitionMatrix = weatherMatrix, name = "states")

###in one command
states(mcTest)
transitionProbability(mcTest, "nice", "snow")
conditionalDistribution(mcTest, "nice")
post2days<-mcTest*mcTest
show(post2days)

testfunct<-function(i){

  for (n in i){
    print(paste("this is matrix and det #",n))
    print("")
  det(matrix.power(weatherMatrix,n))
  show(det(matrix.power(weatherMatrix,n)))  
  print("")
   matrix.power(weatherMatrix,n)
    show(matrix.power(weatherMatrix,n))
    n=n+1
  }
}
testfunct(2)
testfunct(3)
testfunct(5)
testfunct(28)
testfunct(-3)
