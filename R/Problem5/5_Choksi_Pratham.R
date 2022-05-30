#################################################################
#
# Project 9 - Pratham Choksi
# 4/1/22
#
#################################################################


n<-30
x<-matrix(rnorm(n*1000),1000,n)
x[,1:3]<-x[,1:3]*10
y<-1+matrix(rnorm(n*1000),1000,n)


nSim1 <- 1000
alpha <- 0.05
n1 <- 1

# rejection container
reject1 <- rep(0, nSim1)

for (i in 1:nsim1) {
  test1 <- t.test(x[n1,], y[n1,])$p.value
  # Decision rule if p-value < alpha reject H0
  if( test1 > alpha ) {    # if p-value in the test is greater than alpha we dont reject
    reject1[ i ] <- 1
  }
  n1 <- n1+1
}
 
#this counts the number of 0s (rejections of H0)
sum(reject1 == 0 )
#We have a total of 466 test where we reject h0



#Find the zeros of the function
# using numerical technique...
# Look at a linear approximation...
# Involves the tangent line to the curve

f1 <- function( x ) {
  res1 <- 2*10^x^2 - 1
  return(res1)
}

# Picture of the function
x1 <- seq( -20, 20, by = 0.1 )
y1 <- f1( x1 )
plot( x1, y1, type = "l")
abline( h = 0, cl = "red")


x0 <- -17
error1 <- 1 # start with a big error
count1 <- 0
while( error1 > 0.00001 ){
  xold <- x0                    # Store old value
  df1x <- ( f1( x0 + 0.00001 ) - f1( x0 ) )/0.00001
  x0 <- x0 - f1(x0)/df1x     # Update the value
  error1 <- abs( x0 - xold )    # update the condition
  count1 <- count1 + 1        # Update the counter
  if( count1 > 1000 ){ break }
}
count1
x0
points( x0, 0, col = "purple",
        cex = 2,
        pch = 16)
# Starting values I used are:     17,         10,            2,         6,           
# Number of iterations:          1001         807           1001        1001
# x0 value:                   -2.041529     -6.492146    1.566074     3.061956

# Starting values I used are:     9,         -5,            2,         -17,           
# Number of iterations:          1001         983           45        807
# x0 value:                   8.381277        NaN          NaN        NaN



f2 <- function( x ) {
  res2 <- x^2 - 251/187*x + 82/187 
  return(res2)
}


# Picture of the function
x1 <- seq( -10, 10, by = 0.5 )
y1 <- f2( x1 )
plot( x1, y1, type = "l")
abline( h = 0, cl = "red")


x0 <- 15
error1 <- 1 # start with a big error
count1 <- 0
while( error1 > 0.00001 ){
  xold <- x0                    # Store old value
  df2x <- ( f2( x0 + 0.00001 ) - f2( x0 ) )/0.00001
  x0 <- x0 - f2(x0)/df2x     # Update the value
  error1 <- abs( x0 - xold )    # update the condition
  count1 <- count1 + 1        # Update the counter
  if( count1 > 1000 ){ break }
}
count1
x0
points( x0, 0, col = "purple",
        cex = 2,
        pch = 16)
# Starting values I used are:     10,         5,            2,          15,           
# Number of iterations:          10           9            7            11
# x0 value:                   0.7802257     0.7802257    0.7802257     0.7802257

#all of these starting values produced the same number, meaning they are all
#possible zeros


