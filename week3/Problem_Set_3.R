rm(list=ls())
library("utils")
gender_data <- read.csv("C://Users//nguyetanh//Documents//MITx-14.310x//week3//Gender_Stat_Data.csv")
teenager_fr <- subset(gender_data, Indicator.Code == "SP.ADO.TFRT")

#We are only interested the subset of gender_data. To remove gender_data
rm(gender_data)

#View the sturcture of teenager_fr
str(teenager_fr)
##View first 6
head(teenager_fr,6)
##View last 6
tail(teenager_fr,6)

#na.rm = FALSE is default. We need to set na.rm = TRUE to remove missing values

# To find mean and standard deviation of fertility rate in 1960
mean(teenager_fr$X1960, na.rm = TRUE)
sd(teenager_fr$X1960, na.rm = TRUE)

#Exercise: Create a matrix with rows: year, sample mean, average for low income, middle and high income countries
##Step 1: Assign subsets
  low_income <- subset(teenager_fr, Country.Code == "LIC")
  middle_income <- subset(teenager_fr, Country.Code == "MIC")
  high_income <- subset(teenager_fr, Country.Code == "HIC")
  
##Step 2: Create a matrix of 5 rows (5 criteria) and 56 columns (56 years from 1960 to 2015)
  plot_frame <- matrix(NA, 5, 56)
  
##Step 3: Create a loop
  for (i in 5:60){
    k <- i - 4
    j <- i + 1955
    plot_frame[1,k] <- j
    plot_frame[2,k] <- mean(teenager_fr[,i], na.rm = TRUE)
    plot_frame[3,k] <- low_income[,i]
    plot_frame[4,k] <- middle_income[,i]
    plot_frame[5,k] <- high_income[,i]
  }

#Plot matrix: DOUBLE CHECK
  ##limits of x axis - years
    xlim <- range(c(plot_frame[1,]))
  ##Limits of y axis: range from average rates of sample mean, LIC, MIC and HIC
    ylim <- range(c(plot_frame[2,], plot_frame[3,], plot_frame[4,], plot_frame[5,]))
  ##Plot mean rate against year
    plot(plot_frame[1,], plot_frame[2,],type = "l", col = "black", xlim = xlim, ylim = ylim, main = "Evolution of Adolescent Fertility Rate", xlab = "year", ylab = "rate")
  ##Plot LIC rate against year
    plot(plot_frame[1,], plot_frame[3,], col = "blue")
  ##Plot MIC rate against year
    line(plot_frame[1,], plot_frame[4,], type = "l", col = "red")
  ##Plot HIC rate against year
    line(plot_frame[1,], plot_frame[5,], type = "l", col = "yellow")
  ##Use matplot() to combine plots into one window
    matplot(plot_frame[1,], cbind(plot_frame[2,],plot_frame[3,],plot_frame[4,],plot_frame[5,]),type="l",col=c("black","blue","red","yellow"),lty=c(1,1), xlim = xlim, ylim = ylim, main = "Evolution of Adolescent Fertility Rate", xlab = "year", ylab = "rate")
    