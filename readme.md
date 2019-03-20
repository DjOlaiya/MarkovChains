Using R, I modelled the economic transition of countries using a time-homogenous finite markov chain.
A time-homogenous finite markov chain is a process that transitions based purely on the current state of the process. 
Or mathematically, 

{\displaystyle \Pr(X_{n+1}=x\mid X_{n}=y)=\Pr(X_{n}=x\mid X_{n-1}=y)}

for a finite period of time. 

With this model implemented, I will address transitive queries like the ones posted below: 

* If a country is currently classified as Low Income, what is the possibility that it might become a Superpower?

* What is the steady state distribution of countries? 

* What is the probability that a country is classified as Low Income, Middle Income, Upper Middle Income, etc?

* If a country is currently ranked low relative to other countries, how long will it remain there?

Etc. 
 
The initial distribution is taken from data gathered from the Organization for Economic Cooperation and Development (OECD).
