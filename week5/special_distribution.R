#Random draws from uniform distribution
u <- runif(100000,0,1)

#Plot the inverse of cdf of the exponential
pdf("runiform_inverse_exponential.pdf")
inverse_exponential_cdf <- function(x,lambda)log(x)/lambda
y <- inverse_exponential_cdf(u,3)
density_y <- density(y)
plot(density_y, type = "l", xlim = c(0,2), main = "PDF of inverse exponential function", lwd = 3, col = "red", xlab = "")
hide <- dev.off()
