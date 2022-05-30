#################################################################
#
# Project 10 - Pratham Choksi
#
#################################################################



# Sets working directory and imports the file
setwd("C:/Users/prath/Desktop")
Crimedata <- read.csv("BPD_Part_1_Victim_Based_Crime_Data.csv", header = TRUE)
head( Crimedata )



#Question 1:
# Gets the Months of the data
Crimedata.Dates <- as.Date( Crimedata$CrimeDate, format = "%m/%d/%Y")
months(Crimedata.Dates)

# Creates the table for bar plot
shootingMonth <- table(Crimedata$Weapon == "FIREARM", months(Crimedata.Dates))

# Creates the bar plot for shootings by month with all labels and comparisons
barplot( shootingMonth,
         main = "Shooting by Month",
         xlab = "months",
         ylab = "counts",
         las = 2,
         beside = TRUE,
         legend = row.names(shootingMonth))
# August had the most crimes involving a firearm/shooting while February has 
# the least




# Question 2:
LARCENY <- Crimedata[ Crimedata$Description == "LARCENY", ]

topNeighbor <- sort( table( LARCENY$Neighborhood ),
      decreasing = TRUE )

barplot( topNeighbor[1:10],
         main = "Top 10 neighborhoods for LARCENY",
         xlab = "neighborhoods",
         ylab = "counts",
         las = 2)
# The top 10 (from greatest to least) are: DOWNTOWN, INNER HARBOR, NA, 
# BELAIR-EDISON, CANTON, FRANKFORD, CHARLES VILLAGE, MONDAWMIN, FELLS POINT,
# CANTON INDUSTRIAL AREA




# Question 3:
AUTOTHEFT <-  Crimedata[ Crimedata$Description == "AUTO THEFT", ]
TheftHour <- sort( table( AUTOTHEFT$CrimeTime ),
                   decreasing = TRUE )

barplot( TheftHour,
         main = "AUTO THEFT versus hour of the day",
         xlab = "Hours",
         ylab = "counts",
         las = 2)
# 00:04:0 TO 23:56:00 had the lowest frequency of 1 while 22:00:00 had the 
# highest frequency





# Question 4:
AutoTheft.Dates <- as.Date( AUTOTHEFT$CrimeDate, format = "%m/%d/%Y")
MeanAutoTheft <- sort( table(weekdays(AutoTheft.Dates)),
                       decreasing = TRUE )

barplot( MeanAutoTheft,
         main = "mean AUTO THEFT by day of the Week",
         xlab = "day of the week",
         ylab = "counts",
         las = 2)
# All the days are relatively the same with small differences. The day
# With the most mean Auto Theft is Friday while the one with least is 
# Thursday





#Question 5:
AutoTheft.Dates <- as.Date( AUTOTHEFT$CrimeDate, format = "%m/%d/%Y")
YearAutoTheft <- table(format(AutoTheft.Dates, format="%Y"))

year1 <- c("2014", "2015", "2016", "2017", "2018", "2019", "2020")
count1 <- c(3652, 4565, 4612, 4670, 4226, 3751, 38)
YearAutoThefts <- data.frame( Year = year1, 
                        count = count1 )


#Timeplot below - this is with the total count
plot( YearAutoThefts,
      main = "AUTO THEFT per year",
      xlab = "Year",
      ylab = "Count", 
      type = "b")
###########################################################
# Direction: Negative
# Form: non linear
# Strength: Moderate

# A linear regression cannot be made with this graph

# lm()   Linear Model fuction
# lm( Dependent ~ Independent )
lm( YearAutoThefts$count ~ YearAutoThefts$Year )
AutoTheftreg.lm <- lm( YearAutoThefts$count ~ YearAutoThefts$Year )
summary( AutoTheftreg.lm )    #This gives the output you are looking for

# ALL 7 residuals are 0: no residual degrees of freedom!
# Intercept has no meaning as year 0 is not in data.
# There is no regression that can be made with this data





