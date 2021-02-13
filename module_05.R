#Initial Assignment
A <- matrix(1:100, nrow=10)
B <- matrix(1:1000, nrow=10)

#Finding determinants of matrices
det(A)
det(B)

#Finding inverse of matrices
solve(A)
solve(B)

#Both return errors. 
#Matrix A is singular because it's determinant is zero, as shown below:
det(A)

#Matrix B is not square, therefore it does not have an inverse
dim(B)


#After clarification on Canvas
t(A)
t(B)

#create two vectors (a and b)
a <- c(10:19)
b <- c(100:1)

#multiply matrices by vectors
A%*%a 
a%*%A
B%*%b #works because B has 100 columns and b has 100 values
b%*%B #doesn't work because b has 100 values, and B only has ten rows

#Multiply matrices
A%*%B #works because the number of columns in A is equal to the number of rows in B
B%*%A #doesn't work because the number of columns in B is not equal to the number of rows in A 

#Inverse a matrix
S=matrix(2:5, nrow=2)
det(S)
solve(S)
