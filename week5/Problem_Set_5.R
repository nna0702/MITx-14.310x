rm (list = ls())

setwd("/Users/nguyetanh/Documents/MITx-14.310x/week5/")

install.packages("mvtnorm")
library("mvtnorm")

#Set theta = 5
assumed_theta <- 5

#Sample size = 100
sample_size <- 100

#Run 100000 simulations
no_of_simulations <- 100000

#Create a matrix of random generation of uniform distribution (100 * 100000 observations) in which each row consists of 100 observations within a sample. There are 100 columns as a result
simulations <- matrix(runif(sample_size * no_of_simulations, max = assumed_theta), nrow = no_of_simulations)

#To estimate theta, assume that estimator of theta = 2 * sample mean of the uniform distirbution, i.e., finding mean across columns within a row of the matrix simulations
estimator_mean <- 2*apply(simulations, 1, mean)

#Plot the histogram 
p1 <- hist(estimator_mean, breaks = 100)
p1$mean = p1$density


plot(p1, col = "blue", xlim = range(3,7), xlab = "values", ylab = "density")
