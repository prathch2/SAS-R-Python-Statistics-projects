#################################################################
#
# Project 8 - Pratham Choksi
# 3/28/22
#
#################################################################


# Normal distribution
N1 <- rnorm( 1000, 0, 1)
hist( N1, col = "lightblue", xlab = "x", main = "Normal")
# Shape: symmetreic
# center: at 0
# spread: from -3.5 to 3.5
# unusual features: no extreme values


# Gamma
Gam1 <- rgamma(1000, 2, 3)
hist( Gam1, col = "lightgreen", xlab = "x", main = "Gamma 2, 3")
mean(Gam1)
# Shape: skewed to right
# center: mean = 0.6887
# spread: from 0.0 to 3.5
# unusual features: no extreme values


# Normal Chi-Square
NCh1 <- rnorm( 1000, 0, 1) + rchisq(1000, 15)
hist( NCh1, col = "grey", xlab = "x", main = "Normal Chi-square")
mean(NCh1)
# Shape: relatively symeteric/ slightly skewed to right
# center: mean = 15.14398
# spread: from 0 to 40
# unusual features: no extreme values


# Binomial
Bin1 <- rbinom(1000, 1, 0.3)
hist(Bin1, col = "pink", xlab = "x", main = "Binomial")
mean(Bin1)
# Shape: slightly skewed to right
# center: mean = 0.304
# spread: from 0 to 1
# unusual features: no extreme values. There are no values between 0 and 1








# Created empty vectors to append n means.
means1 = c()
means2 = c()
means3 = c()
means4 = c()
means5 = c()
means6 = c()


for( i in 1:1000) {
  Bins1 <- rbinom(2, 1, 0.4)
  means1 <- c(means1, mean(Bins1))
}
hist(means1, col = "purple", xlab = "x", main = "Binomial n=2")
# Shape: slightly skewed to right
# center: 0.4
# spread: from 0 to 1
# unusual features: no extreme values. 
 

for( i in 1:1000) { 
  Bins2 <- rbinom(5, 1, 0.4)
  means2 <- c(means2, mean(Bins2))
}
hist(means2, col = "purple", xlab = "x", main = "Binomial n=5")
# Shape: skewed to right
# center: 0.4
# spread: from 0 to 1
# unusual features: no extreme values.


for( i in 1:1000) {
  Bins3 <- rbinom(10, 1, 0.4)
  means3 <- c(means3, mean(Bins3))
}
hist(means3, col = "purple", xlab = "x", main = "Binomial n=10")
# Shape: relatively symmetric
# center: 0.4
# spread: from 0 to 1
# unusual features: no extreme values.


for( i in 1:1000) {
  Bins4 <- rbinom(20, 1, 0.4)
  means4 <- c(means4, mean(Bins4))
}
hist(means4, col = "purple", xlab = "x", main = "Binomial n=10")
# Shape: relatively symmetric
# center: 0.4
# spread: from 0 to 1
# unusual features: no extreme values.


for( i in 1:1000) {
  Bins5 <- rbinom(50, 1, 0.4)
  means5 <- c(means5, mean(Bins5))
}
hist(means5, col = "purple", xlab = "x", main = "Binomial n=50")
# Shape: symmetric
# center: 0.4
# spread: from 0 to 0.8
# unusual features: no extreme values.


for( i in 1:1000) {
  Bins6 <- rbinom(100, 1, 0.4)
  means6 <- c(means6, mean(Bins6))
}
hist(means6, col = "purple", xlab = "x", main = "Binomial n=100")
# Shape: symmetric
# center: 0.4
# spread: from 0.2 to 0.6
# unusual features: no extreme values.



# As n increased, the gap between the histograms got smaller and 
# closer together. Also the shape of the histograms became more
# symmetric. In addition, the spread got smaller.

