#Best practice to clean the environment in the beginning
rm(list = ls())

#Exercise: Construct cdf of binomial distribution with parameters size = 1000, n = 8, p = 0.5

#Step 1: Generate binomial distribution
my_binom <- rbinom(1000,8,0.5)

#Step 2: Define k vector
k <- c(0:8)

#Step 3: initialise cdf vector of 9 entries
cdf <- rep(0.0,9)

##Edx approach: Use estimation
  for (i in 0:8){
    j <- i+1
    cdf[j] <- (sum(my_binom <= i))/1000
  }

##Alternative approach: cdf = cumulative sum of pdfs
  cdf[1] <- dbinom(0,8,0.5)
  for (i in 1:8){
    cdf[i+1] <- cdf[i] + dbinom(i+1,8,0.5)
  }
