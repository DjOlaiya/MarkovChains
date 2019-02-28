#MY ESTIMATES FROM  WORLD BANK DATA
require(markovchain)
library(DiagrammeR)
library(diagram)
library(readxl)
#read in data
GNI_States<-read_excel(path = "INCOMEGRPDATA.xlsx",col_names = TRUE ,na= "..")
GNI_States<-replace(GNI_States, GNI_States=="LM*","LM")

#fittest
Est_MC<-markovchainFit(data = GNI_States[,2:31],name = "EconomicTransience",confint= FALSE)
ClassMC<-Est_MC$estimate
Est_MC

##how do i swqp the rows so that the data is not in alphabetical order
Est_MC$estimate
#sequence test
IncMatrix <-rmarkovchain(n=50,Est_MC$estimate,t0="L")
IncMatrix

#simulation
Est_MC$estimate^100
period(ClassMC)
is.accessible(Est_MC$estimate)
steadyStates(ClassMC)
is.irreducible(ClassMC)
summary(Est_MC)

########################################################################
########################################################################
#create a new MC with only wolrd bank and add possible state S
#to compare Estimates.
GN_States<-read_excel(path = "INCOMEGRPDATA1.xlsx",col_names = TRUE ,na= "..")
GN_States<-replace(GNI_States, GNI_States=="LM*","LM")

#fittest
Est_MC1<-markovchainFit(data = GNI_States[,2:31],name = "EconomicTransience",confint = FALSE,possibleStates = 'S')
dim(Est_MC1)
EconMC<-summary(Est_MC1)
showClass(Est_MC1)
transitionProbability(Est_MC1)


########################################################################
########################################################################
#transiotin matrix from MCfit
probMat<-matrix(c( 0.96194927,0.03738318,0.0006675567,0.000000000, 0.0000000000,         
                   0.02286774,0.93263288,0.0438813350, 0.000618047,0.0000000000,     
                   0.00000000,0.02575488, 0.9307282416,0.042628774, 0.0008880995,         
                   0.00000000,0.00000000, 0.0165394402,0.980916031, 0.00254452593,        
                   0.00000000,0.00000000 , 0.0000000000, 0.170731707, 0.8292682927),nrow=5,byrow = TRUE)        
 EconTransMatrix<-round(probMat,4)
 EconTransMatrix[4,3]+0.0001->EconTransMatrix[4,3]
rowSums(EconTransMatrix)
 ########################################################################
 # make new Markov chain
 States<-c('L','LM','UM','H','S')
 EconMC<-new("markovchain",States,byrow = byRow,transitionMatrix = EconTransMatrix, name= "Economic Transition Matrix")
show(EconMC)
########################################################################
# make new Markov sim
MC.sim(100,EconTransMatrix,States,5)
xtable(EconTransMatrix)
is.accessible(EconMC,'L','S')
is.accessible(EconMC,'L','LM')
is.accessible(EconMC,'L','UM')
is.accessible(EconMC,'L','H')
is.accessible(EconMC,'S','L')
#type of MC
communicatingClasses(EconMC)
is.irreducible(EconMC)
period(EconMC)
plot(EconMC, package="Rdiagram")

require(igraph)
mcIgraph <- as(EconMC, "igraph")
plot.igraph(mcIgraph, vertex.color="green" )

######Steady state
sE<-steadyStates(EconMC)
xtable(s)
s

#########################
#confirm steady state
ten<-matrix.power(EconTransMatrix,500)
xtable(ten)
round(matrix.power(EconTransMatrix,6),2)
EconTransMatrix
t(EconTransMatrix)

#########eigenvector of transpose for stationary
v<-eigen(t(EconTransMatrix))
v$val
v$vect
ev <- v$vect[,1] / sum(v$vect[,1])
ev
v

############stationary distribution complete
I <- diag(5)
I
nsp <- nullspace(t(EconTransMatrix - I))
xtable(nsp)
nsE <- round(nsE / sum(nsE),2)
xtable(nsE)

########fundamental matrix complete
Ii <- diag(dim(EconTransMatrix)[2])
Ii
PPI<-rbind(sE,sE,sE,sE,sE)
PPI
Z <- solve(I -EconTransMatrix+PPI )
xtable(Z)


############## M matrix complete
s1=as.vector(sE)
dppi<-diag(s1,dim(EconTransMatrix)[2],dim(EconTransMatrix)[2])
dppi
idppi<-solve(dppi)
idppi
E<-matrix(1, dim(EconTransMatrix)[2],dim(EconTransMatrix)[2])
E
d=diag(Z)
d
d1=as.vector(d)
d1
DZ=diag(d1,dim(EconTransMatrix)[2],dim(EconTransMatrix)[2])
DZ
M<-(I-Z+E%*%DZ)%*%idppi
M
xtable(M)
