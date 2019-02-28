# generate the matrix P and the MC
getP<-function(n,p,r){
P<-matrix(0,n+1,n+1)
for (i in 1:n) {
P[i,i-1]<-r*(1-p)
P[i,i]<-1-r*(1-p)-p*(1-r)
P[i,i+1]<-p*(1-r)
}
P[1,1]<-1-p
P[1,2]<-p
P[n+1,n]<-r
P[n+1,n+1]<-1-r
S<-as.character(0:n)
row.names(P) <- S; 
colnames(P) <- S
mcQ <- new("markovchain", states = S, byrow = TRUE,transitionMatrix = P, name = "Que")
summary(mcQ)
mcQ
}

