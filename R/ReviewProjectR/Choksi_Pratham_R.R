#Reads in Employee.csv datafile into a dataset named Employee.
Employee <- read.csv("C:/Users/prath/Desktop/Employee-1.csv")

#Function for generating a summary of the data
mysummary1 <- function( x1, name1 = "x" ) {
  xmean1 <- mean(x1)  
  xsd1 <- sd(x1)   
  xmedian1 <- median(x1)  
  xq1 <- quantile( x1, 0.25 )    
  xq3 <- quantile( x1, 0.75)
  xIQR <- quantile( x1, 0.75 ) - quantile( x1, 0.25)
  xmax1 <- max( x1 )
  xmin1 <- min( x1 )
  output1 <- data.frame( mean = xmean1,  
                         sd = xsd1,    
                         median = xmedian1,
                         q1 = xq1,
                         q3 = xq3,
                         IQR = xIQR,
                         max = xmax1,  
                         min = xmin1)
  rownames( output1 ) <- name1
  return( output1 )
}

#Provides the summary for rate and monthsEmp
mysummary1(Employee$Rate)
#       mean     sd     median    q1     q3   IQR   max   min
#   29.51622   7.155      28    24.25  34.75  10.5  46.5  15.25
mysummary1(Employee$MonthsEmp)
#       mean         sd     median   q1   q3  IQR  max   min
#    48.64865   37.11001      39     17   82  65  138     1


#Histogram of MonthsEmp
hist(Employee$MonthsEmp,
     xlab = "MonthsEmp",  #x-label
     main = "Number of Months Employed"  #title
)
# center about 50
# spread: from 0 to 140
# shape: skewed to the right and bimodal
# unusual features: none



#Subset the roles
Manager <- Employee[ Employee$Role == "Manager", ]
Assistant <- Employee[ Employee$Role == "Assistant Mgr", ]
Staff <- Employee[ Employee$Role == "Staff", ]

#Summaries of Rate and MonthsEmp grouped by Role
Role.summary <- rbind (mysummary1(Manager$Rate, "RateM"),
                       mysummary1(Assistant$Rate, "RateAm"),
                       mysummary1(Staff$Rate, "RateS"),
                       mysummary1(Manager$MonthsEmp, "MonthsEmpM"),
                       mysummary1(Assistant$MonthsEmp, "MonthsEmpAm"),
                       mysummary1(Staff$MonthsEmp, "MonthsEmpS"))

print(Role.summary)
#                 mean        sd  median      q1       q3     IQR    max   min
#RateM        42.94444  2.165158  42.375 41.3125  44.8750  3.5625  46.50 40.25
#RateAm       37.31250  1.351654  37.375 36.1875  38.5625  2.3750  39.75 35.25
#RateS        26.20683  4.521079  26.500 22.5000  29.6250  7.1250  34.75 15.25
#MonthsEmpM  113.77778 18.732028 119.500 99.5000 127.7500 28.2500 138.00 82.00
#MonthsEmpAm  88.03571 11.808604  90.000 81.0000  97.2500 16.2500 102.00 44.00
#MonthsEmpS   32.28058 25.055888  26.000 12.0000  45.0000 33.0000 100.00  1.00


# Scatterplot of Rate vs. MonthsEmp
# lm()   Linear Model fuction
# lm( Dependent ~ Independent )
#Fit a Regression Line Y~X
Emp1reg <- lm( Employee$Rate ~ Employee$MonthsEmp )

plot( Employee$MonthsEmp, Employee$Rate,
      xlab = "MonthsEmp",
      ylab = "EmpRate",
      col = "blue",
      pch = "@")
abline( Emp1reg, col = "hotpink",
        lwd = 2,    # Line width
        lty = 3)    # Line type
# Direction: Positive
# Form: Roughly linear
# Strength: Moderate


#Create a confidence interval for the regression coefficients
confint( Emp1reg )
#                       2.5 %     97.5 %
# (Intercept)        20.3504391  21.8790240
# Employee$MonthsEmp  0.1601936  0.1852007

# Hypothesis test
summary( Emp1reg )
# P-value is 2*10^-16
# Y intercept: 21.114732
# This is predicted mean amount of Rate with MonthsEmp at 0
# Nonsense! Extrapolation because the data does not span zero

#x-intercept = (Y = 0)
-Emp1reg$coefficients[1]/Emp1reg$coefficients[2]
#Employees will have a negative rate,-122.2645,
#when Months Employed is 0
# Nonsense! Extrapolation 


#Reads in TimeCard.csv datafile into a dataset named Sales1
Sales1 <- read.csv("C:/Users/prath/Desktop/TimeCard-1.csv")

#Histogram of MonthsEmp
hist(Sales1$Hours,
     xlab = "Hours",  #x-label
     main = "Number of Sale Hours"  #title
)
# center about 38
# spread: from 28 to 40
# shape: skewed to the left
# unusual features: none



SalesEmp <- merge(Sales1, Employee, by = "EmpID")
# Y~X Boxplot analysis
boxplot( SalesEmp$Hours ~ SalesEmp$Role)
# Assistant Mgr ->
# center about 38
# spread: from 37 to 40
# shape:  somewhat skewed to right
# unusual features: outlier at 36, 35, 30

# Manager ->
# center about 39
# spread: from 35 to 40
# shape:  skewed to left
# unusual features: outlier at 33

# Staff ->
# center about 38
# spread: from 34 to 40
# shape:  skewed to left
# unusual features: outlier at 33, 33.5, 32, 31, 29. 28




# ANOVA for Hours against Role

# mu1 = mean Hours as Assistant Mgr 
# mu2 = mean Hours as Manager
# mu3 = mean Hours as Staff
# H0: mu1 = mu2 = mu3
# Ha: at least two mu differ
# Significant level: alpha = 0.01
# Test statistic
Emp.aov <- aov( Hours ~ Role, data = SalesEmp )
summary( Emp.aov )
# Decision rule: If p-value < alpha reject H0
# Execute
#                Df Sum Sq Mean Sq F value Pr(>F)
#SalesEmp$Role   2   16.0   8.015   1.568  0.211
#Residuals     182  930.5   5.112               
#
# Decision: Since the p-value 0.211 > alpha we fail to reject H0.
# Conclusion: We have sufficient evidence to claim
# that mean hours does not differ across roles.

# Where are the differences?
# Since there are no differences, Turkey's post hoc test is not needed








