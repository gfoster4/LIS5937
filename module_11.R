tukey_multiple <- function(x) {    #Original Function from Canvas
   outliers <- array(TRUE,dim=dim(x))
   for (j in 1:ncol(x))
   {
     outliers[,j] <- outliers[,j] && tukey.outlier(x[,j])
   }
   outlier.vec <- vector(length=nrow(x))
   for (i in 1:nrow(x))
   {
     outlier.vec[i] <- all(outliers[i,])
   }
   return(outlier.vec)
   }

 num <- rnorm(10000, mean = 5000, sd = 1) #Generating 10000 numbers in a normal distribution

 sample <- matrix(data = num, nrow = 100, ncol = 100, dimnames = NULL) #Organizing the 10000 numbers in a 100x100 matrix


 tukey_multiple(sample)  #Cannot find the function 'tukey.outlier'
 debug(tukey_multiple(sample)) #Same result


library(funModeling)

tukey_multiple1 <- function(x) { 
  outliers <- array(TRUE,dim=dim(x)) 
  for (j in 1:ncol(x)) 
  { 
    outliers[,j] <- outliers[,j] && tukey_outlier(x[,j])  #Had to replace tukey.outlier() with tukey_outlier() from the funModeling package
  } 
  outlier.vec <- vector(length=nrow(x)) 
  for (i in 1:nrow(x)) 
  { 
    outlier.vec[i] <- all(outliers[i,]) 
  } 
  return(outlier.vec) 
  }

num <- rnorm(10000, mean = 5000, sd = 1) #Generating 10000 numbers in a normal distribution

sample <- matrix(data = num, nrow = 100, ncol = 100, dimnames = NULL) #Organizing the 10000 numbers in a 100x100 matrix

tukey_multiple1(sample) #There's an output now, but still not sure if the function is operating properly...


# debug(tukey_multiple1(sample)) #Not sure why it's giving me an error here, since tukey_multiple() is a function.

