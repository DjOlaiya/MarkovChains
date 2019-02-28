MC.sim <- function(n,P,S,x1) {
sim <- as.numeric(n)
m <- ncol(P)
if (missing(x1)) {
sim[1] <- sample(1:m,1) # random start
} else { sim[1] <- x1 }
 for (i in 2:n) {
 newstate <- sample(1:m,1,prob=P[sim[i-1],])
 sim[i] <- newstate
 }
sim1=array(1,n)
for (i in 1:n) {
 sim1[i]=S[sim[i]]
} 
sim1
}