#General codes

#It is a good practice to remove all the current existing objects in R when starting a new session
rm(list=ls())

#Set working directory
setwd(path)

#Create a data frame that contains only the relevant information from a big dataset
  small_data_frame <- subset(big_data, criteria)
  
#See the structure of an object in R
str(dataframe)
  ##See first n observations of dataframe
    head(dataframe, n)
  ##See last n observations of dataframe
    tail(dataframe, n)
    
#Treatment of missing values
  ##By default, na.rm = FALSE, we need to remove (rm) these values
na.rm = TRUE

#Create a matrix with n rows and m columns
matrix(data, n, m )

#dataframe: 
  ##extract all entries of column ith in the dataframe
    dataframe[,i]
  ##extract all entries of row ith in the dataframe
    dataframe[i,]

#Basic comands to plot graph
  ##Set the range 
    xlim <- range(c())
  ##Set the plot with vector 1 on x-axis, vector 2 on y-axis, type of plot is line ("l"), colour (col),title of graph ("Main), xlab and ylab are labels of axes
    plot(vector 1, vector 2, type = "l", col = "black" xlim = xlim, ylim = ylim, main = "ABC", xlab = "year", ylab = "rate")
  ##Connect plots into a line
    lines(vector 1, vector 3, col = "red")
    
#Plot histogram
  ##freq is a logical, if TRUE - represents frequencies (counts), if FALSE = probability densities (component density), breaks = number of bins
    p1 <- hist(data, freq = FALSE, breaks = 20)
  ##Kernel Density Estimation
    density(dataframe, na.rm = TRUE)
  ##Colour of lines in which alpha measures transparency
    col = rgb(R,G,B,alpha)
  ##Add to current plot
    add = TRUE
  ##Line width
    lwd = 5
  ##Legend
    legend("position", ncol, legend = c("X","Y"), fill = c(rgb(R,G,B,alpha), rgb(R,G,B,alpha)), text.width = 20)
    ###position with relative to the graph
    ###legend vector: titles to be included in the legend
    ###fill vector: rgb functions - colours of variables
  