#estimations
install.packages("markovchain","diagram","diagrammeR")
require(markovchain)
library(DiagrammeR)
library(diagram)
weatherStates <- c("rain", "nice", "snow")
byRow <- TRUE
weatherMatrix <- matrix(data = c(0.50, 0.25, 0.25,0.5, 0, 0.5,0.25,0.25, 0.5), byrow = byRow, nrow = 3,dimnames = list(weatherStates, weatherStates))

mcWeather <- new("markovchain", states = weatherStates, byrow = byRow,transitionMatrix = weatherMatrix, name = "Weather")
show(mcWeather)
#simulationg from a MC
weathersOfDays <- rmarkovchain(n = 365, object = mcWeather, t0 = "nice")
weathersOfDays[1:30]
# estimations from a sequence with MLE
weatherFittedMLE <- markovchainFit(data = weathersOfDays, method = "mle",name = "Weather MLE")
weatherFittedMLE$estimate
show(mcWeather)

weathersOfDays <- rmarkovchain(n = 1000, object = mcWeather, t0 = "nice")
weatherFittedMLE <- markovchainFit(data = weathersOfDays, method = "mle",name = "Weather MLE")
weatherFittedMLE$estimate
show(mcWeather)

weatherFittedMLE$confidenceInterval


weatherFittedLAPLACE <- markovchainFit(data = weathersOfDays,method = "laplace", laplacian = 0.01, name = "Weather LAPLACE")
weatherFittedLAPLACE$estimate 


createSequenceMatrix(stringchar = weathersOfDays)
#MC fitted from a matrix of data
data(holson)
holson
singleMc<-markovchainFit(data=holson[,2:12],name="holson")
singleMc$estimate

singleMc1<-markovchainFit(data=rain$rain,name="rain")
singleMc1$estimate


#small simulation
c1<-c("a","b","a","a","c","c","a")
mylistMc<-markovchainFit(data=c1)
mylistMc
data(rain)

#
verifyMarkovProperty(rain$rain)
#

assessOrder(rain$rain)

#
assessStationarity(weathersOfDays, 1)
assessStationarity(rain$rain, 2)