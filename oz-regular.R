install.packages("markovchain","diagram","diagrammeR")
require(markovchain)
library(DiagrammeR)
library(diagram)
require(pracma)
library(matrixcalc)
library(ggplot2)

library(matlab)

weatherStates <- c("rain", "nice", "snow")
byRow <- TRUE
weatherMatrix <- matrix(data = c(0.50, 0.25, 0.25,0.5, 0, 0.5,0.25,0.25, 0.5), byrow = byRow, nrow = 3)
row.names(weatherMatrix) <- weatherStates; 
colnames(weatherMatrix) <- weatherStates
mcWeather <- new("markovchain", states = weatherStates, byrow = byRow,transitionMatrix = weatherMatrix, name = "Weather")
#clasification of states
summary(mcWeather)
is.irreducible(mcWeather)
#period of an irreducible mc
period(mcWeather)
print(mcWeather)
show(mcWeather)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
matrix.power(weatherMatrix,20)
round(matrix.power(weatherMatrix,6),2)
weatherMatrix
t(weatherMatrix)
%%the stationary distribution- eigenvector of the transpose matrix%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v<-eigen(t(weatherMatrix))
v$val
v$vect
ev <- v$vect[,1] / sum(v$vect[,1])
ev
%%%%%stationary distrib%%%%%%%%%%%%%%%%
I <- diag(3)
ns <- nullspace(t(weatherMatrix - I))
ns <- round(ns / sum(ns),2)
ns
%%%%%%%%%%%%%%%%%%%%%%%%

s=steadyStates(mcWeather)
s
%%%%%the prob for the first passage
firstPassage(mcWeather,"rain",20)
%%%%%%%%%%%fundamental matrix Z %%%%%%%%%%%%%%
I <- diag(dim(weatherMatrix)[2])
I
PPI<-rbind(s,s,s)
PPI
Z <- solve(I -weatherMatrix+PPI )
Z
%%%%%%%%%%%%%the matrix M%%%%%%%%%%%%%%
s1=as.vector(s)
dppi<-diag(s1,dim(weatherMatrix)[2],dim(weatherMatrix)[2])
dppi
idppi<-solve(dppi)
idppi
E<-matrix(1, dim(weatherMatrix)[2],dim(weatherMatrix)[2])
E
d=diag(Z)
d
d1=as.vector(d)
d1
DZ=diag(d1,dim(weatherMatrix)[2],dim(weatherMatrix)[2])
DZ
M<-(I-Z+E%*%DZ)%*%idppi
M
%%%%%%%%%%%%%plot of markov chain rain=1, nice=1, snow 3
regMCts <- rmarkovchain(n=100,object=mcWeather)
regMCts
regMCtsDf <- as.data.frame(regMCts,stringsAsFactors = TRUE)
regMCtsDf
regMCtsDf$index <- 1:100
regMCtsDf$regMCts <- as.numeric(regMCtsDf$regMCts)
require(ggplot2)

library(ggplot2)
p <- ggplot(regMCtsDf,aes(index,regMCts))
p  +geom_point(colour="dark red")+
xlab("time") +
ylab("state") +
ggtitle("OZ Markov Chain")
