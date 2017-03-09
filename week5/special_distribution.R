#Exercise 1: Create cdf of exponential distribution

rm(list = ls())

#Step 1: Generate uniform distribution U[0,1] random variable
u <- runif(10000,0,1)

#Step 2: Construct pdf

  ##Approach 1: Use the fact that we can transform a uniform distribution U[0,1] random variable by the inverse of a cdf and get a random variable with that cdf
 
    #We know the if Y is an exponential distribution RV, x = F(y) = 1 - e^(-lambda * y). Hence, the inverse function of cdf is y = - log(1-x)/ lambda. Since X and 1-X has the same distribution, we can write Y = -log(X)/lambda.
    #Define the inverse cdf.Note that X is a random variable from uniform distribution u
      inverse_cdf1 <- function(x,lambda) -log(x)/lambda 
      y <- inverse_cdf1(u,3)
      
    #Find the distribution of y. Function density computes kernel density estimate
      density_y <- density(y)
      
    #Plot the pdf: pdf starts the graphic driver for producing pdf graphics
      pdf("exponential.pdf")
      plot(density_y, type = "l", xlim = c(0,2), main = "pdf of inverse exp", col = "blue", lwd = 3, xlab = "")
      hide <- dev.off()
  
  ##Approach 2: Plot the inverse of cdf of the exponential using qexp
      
      pdf("inverse_exponential.pdf")
      y_qexp <- qexp(u, rate = 3)
      density_y_qexp <- density(y_qexp)
      
      hide <- dev.off ()
      
      plot(density_y_qexp, type = "l", xlim = c(0,2), main = "pdf of inverse exponential function", col = "yellow", lwd = 3, xlab = "")
      
  ##Approach 3: Compare to random draws straight from the exponential distribution
      pdf("random_draw.pdf")
      y_rexp <- rexp(10000, rate = 3)
      density_y_rexp <- density(y_rexp)
      hide <- dev.off()
      plot(density_y_rexp, type = "l", xlim = c(0,2), main = "random draw from exp distribution", lwd = 3, col = "red", xlab = "")
      
      