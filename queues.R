n=4
p=0.2
r=0.7
mc1=getP(n,p,r)
show(mc1)
s=steadyStates(mc1)

s

nsim=10000
simMC1<- rmarkovchain(n=nsim,object=mc1)
simMC1
l=matrix(0,1,n+1)
for (i in 0:n) {
i1=as.character(i)
l[1,i+1]<-length(which(simMC1==i1))
}
l
l/nsim
s
h1=as.numeric(simMC1)
h1
av=mean(h1)
av
###################
n=4
p=0.7
r=0.2
mc2=getP(n,p,r)
s2=steadyStates(mc2)
s2
nsim=10000
simMC2<- rmarkovchain(n=nsim,object=mc2)
simMC2
l2=matrix(0,1,n+1)
for (i in 0:n) {
i1=as.character(i)
l2[1,i+1]<-length(which(simMC2==i1))
}
l2
l2/nsim
s2
h2=as.numeric(simMC2)
h2
av2=mean(h2)
av2

#######################
n=4
p=0.3
r=0.3
mc3=getP(n,p,r)
s3=steadyStates(mc3)
s3
nsim=1000
simMC3<- rmarkovchain(n=nsim,object=mc3)
simMC3
l3=matrix(0,1,n+1)
for (i in 0:n) {
i1=as.character(i)
l3[1,i+1]<-length(which(simMC3==i1))
}
l3
l3/nsim
s3
h3=as.numeric(simMC3)
h3
av3=mean(h3)
av3

