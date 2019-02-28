install.packages("markovchain","diagram","diagrammeR")
require(markovchain)
library(DiagrammeR)
library(diagram)
weatherStates <- c("rain", "nice", "snow")
byRow <- TRUE
weatherMatrix <- matrix(data = c(0.50, 0.25, 0.25,0.5, 0, 0.5,0.25,0.25, 0.5), byrow = byRow, nrow = 3,dimnames = list(weatherStates, weatherStates))

mcWeather <- new("markovchain", states = weatherStates, byrow = byRow,transitionMatrix = weatherMatrix, name = "Weather")

###in one command
mcWeather <- new("markovchain", states = c("rain", "nice", "snow"),transitionMatrix = matrix(data = c(0.50, 0.25, 0.25,0.5, 0, 0.5,0.25,0.25, 0.5), byrow = byRow, nrow = 3),name = "Weather")

states(mcWeather)
names(mcWeather)
dim(mcWeather)
transitionProbability(mcWeather, "nice", "rain")
conditionalDistribution(mcWeather, "nice")

print(mcWeather)
show(mcWeather)
plot(mcWeather, package="Rdiagram")
require(igraph)
mcIgraph <- as(mcWeather, "igraph")
plot.igraph(mcIgraph, vertex.color="green" )
mcIgraph
#####################
after2Days <- mcWeather * mcWeather
show(after2Days)
after10Days <- mcWeather ^ 10
show(after10Days)
after20Days <- mcWeather ^ 20
show(after20Days)
