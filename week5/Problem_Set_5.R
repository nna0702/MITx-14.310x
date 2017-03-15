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
p1$mean = p1$density #Don't know why yet

pdf("Histogram_of_mean.pdf")
plot(p1, col = rgb(1,0,1/2,1/2), xlim = range(3,7), xlab = "values", ylab = "density")
hide <- dev.off()

#Another estimate of theta could be = 2 * median of sample of uniform distribution,i.e., finding median across columns within a row of the matrix
estimator_median <- 2*apply(simulations, 1, median)

#Plot histogram
p2 <- hist(estimator_median, breaks = 100)
p2$counts = p2$density #Don't know why yet

pdf("Histogram.pdf")
xlim <- range(p1$mids, p2$mids)
plot(p1, col = rgb(0,1,1/2,1/2), xlim = xlim, xlab = "values", ylab = "density")
plot(p2, col = "blue", add = TRUE)
hide <- dev.off()

