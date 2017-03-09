#Exercise 1: Construct pdf of exponential distribution

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
      hide <- dev.off()
      plot(density_y, type = "l", xlim = c(0,2), main = "pdf of inverse exp", col = "blue", lwd = 3, xlab = "")
      
  
  ##Approach 2: Plot the inverse of cdf of the exponential using qexp - inverse of cdf (pexp)
      
      pdf("inverse_exponential.pdf")
      y_qexp <- qexp(u, rate = 3)
      density_y_qexp <- density(y_qexp)
      
      hide <- dev.off ()
      
      plot(density_y_qexp, type = "l", xlim = c(0,2), main = "pdf of inverse exponential function", col = "yellow", lwd = 3, xlab = "")
      
  ##Approach 3: Compare to random draws straight from the exponential distribution. Function rexp - random generation from exponential distribution
      pdf("random_draw.pdf")
      y_rexp <- rexp(10000, rate = 3)
      density_y_rexp <- density(y_rexp)
      hide <- dev.off()
      plot(density_y_rexp, type = "l", xlim = c(0,2), main = "random draw from exp distribution", lwd = 3, col = "red", xlab = "")
      
  #*** NOte: Need to clarify the dev.off(). Without this, plots do not show up???
  #*** NOte: Approach 1 and 2 use inverse sampling method
      
#Excercise 2: Consider a deck of 52 cards. Suppose that you sample 10 cards from the deck without replacing the cards. What is the probability that exactly five of the cards are hearts?
    #Compute density of a hypergeometric distribution
      dhyper(5,13,39,10)
      
#Excercise 3: Functions associated with ormal distribution
    #Generate 1000 number from a normal with mean = 3, sd = 0.25
      v <- rnorm(1000,3,0.25)
    
    #Probability density function - find the hieght of the normal with mean = 0 and sd = 0.5
      dnorm(0,0,0.5)
      
    #Cumulative Distribution Function - Area under the standard normal curve to the left of 1.96. Lower.tail = FALSE is default - what is to the right
      pnorm(1.96,0,1)
      
    #Quantile function is the inverse of pnorm. Find the value at which cdf of standard normal is 0.975
      qnorm(0.975,0,1)
      
#Excercise 4: Plot pdf of normal distribution
      
  ##Approach 1: Inverse sampling method
      y_qnorm <- qnorm(u)
      density_y_qnorm <- density(y_qnorm, bw = 1)
      pdf("normal.pdf")
      hide <- dev.off()
      plot(density_y_qnorm, type = "l", xlim = c(-5,5), main = "pdf of normal distribution", col = "navyblue", lwd = 3, xlab = "")
  
  ##Approach 2: Random generation from normal distribution
      y_rnorm <- rnorm(10000,0,1)
      density_y_rnorm <- density(y_rnorm, bw = 1)
      pdf("random_norma.pdf")
      hide <- dev.off()
      plot(density_y_rnorm, type = "l", xlim = c(-5,5), main = "pdf of normal distribution from random draw", col = rgb(0.4,0.5,0.8,0.7), lwd = 3, xlab = "")
      