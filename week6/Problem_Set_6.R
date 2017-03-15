#preliminaries
rm(list = ls())
setwd("/Users/nguyetanh/Documents/MITx-14.310x/week6/")

#Real value of theta
theta <- 5
#sample size
n <- 25

#Generating 1000 samples of size n
simul <- 1000

#Generate a matrix in which each column corresponds to a sample of size 25
sample <- matrix(runif(1000*n, max = theta), nrow = n)

#Estimator of theta = (n+1)/n * nth order statistics of X. The multiplier is meant to correc the bias
thetahat <- (n+1)/n*apply(sample, 2, max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll & theta<=ul)
mean(thetain)

