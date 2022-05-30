#################################################################
#
# Project 7 - Pratham Choksi
#
#################################################################

#Working Directory
setwd("C:/TempData")

Sales <- read.csv( "StoreSales.csv", header = TRUE )





# Scatterplot...
plot( Sales$Month, Sales$Revenue,
      xlab = "month",
      ylab = "revenue",
      main = "Revenue vs. Month",
      col = "blue")
abline( lm( Sales$Revenue ~ Sales$Month) )
# Direction: positive
# Form: no clear relationship
# Strength: moderate
# Outlier: Month 12





# Created function to get summaries
mysummary1 <- function( x1, name1 = "x" ) {
  xmean1 <- mean(x1)  
  xsd1 <- sd(x1)   
  xmedian1 <- median(x1)  
  xq1 <- quantile( x1, 0.25 )    
  xq3 <- quantile( x1, 0.75)
  xIQR <- quantile( x1, 0.75) - quantile( x1, 0.25)
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

# Subset data for stores to make getting summaries easier
S1 <- Sales[Sales$Store == "MA0041", c(3)]
S2 <- Sales[Sales$Store == "MA0044", c(3)]
S3 <- Sales[Sales$Store == "NC0041", c(3)]
S4 <- Sales[Sales$Store == "NE0041", c(3)]
S5 <- Sales[Sales$Store == "NM0003", c(3)]
S6 <- Sales[Sales$Store == "NM0004", c(3)]
S7 <- Sales[Sales$Store == "NM0034", c(3)]
S8 <- Sales[Sales$Store == "NM0331", c(3)]
S9 <- Sales[Sales$Store == "RI0031", c(3)]
S10 <- Sales[Sales$Store == "SC0001", c(3)]
S11 <- Sales[Sales$Store == "SC0041", c(3)]
S12 <- Sales[Sales$Store == "SC0345", c(3)]
S13 <- Sales[Sales$Store == "VA0031", c(3)]

#Summaries of revenues for each store. Listed in comment below
store.summary <- rbind( mysummary1(S1, "MA0041"),
                       mysummary1(S2, "MA0044"),
                       mysummary1(S3, "NC0041"),
                       mysummary1(S4, "NE0041"),
                       mysummary1(S5, "NM0003"),
                       mysummary1(S6, "NM0004"),
                       mysummary1(S7, "NM0034"),
                       mysummary1(S8, "NM0331"),
                       mysummary1(S9, "RI0031"),
                       mysummary1(S10, "SC0001"),
                       mysummary1(S11, "SC0041"),
                       mysummary1(S12, "SC0345"),
                       mysummary1(S13, "VA0031")
)

#  Store      mean    sd      median    q1      q3      IQR       max     min
# -----------------------------------------------------------------------------
# MA0041    1773216 292648.4 1687540 1646386 1752071 105684.83 2676496 1596073
# MA0044    1791352 271824.1 1738690 1686696 1787414 100717.72 2608373 1556242
# NC0041    1726232 249654.9 1634213 1590793 1733783 142989.54 2452462 1538689
# NE0041    1763524 217042.9 1706901 1680505 1765550  85045.07 2412215 1549432
# NM0003    1734061 272780.7 1679170 1616153 1728049 111896.42 2560826 1491877
# NM0004    1731194 251985.8 1669338 1640866 1701121  60255.12 2507212 1542016
# NM0034    1758293 307288.4 1670653 1633940 1766750 132810.19 2705793 1541627
# NM0331    2161466 229514.1 2112982 2031838 2185176 153338.29 2826570 1940277
# RI0031    1698196 252218.8 1654064 1574373 1667253  92880.15 2458571 1515876
# SC0001    1755348 197305.3 1699951 1663882 1768147 104264.41 2341589 1605479
# SC0041    1739878 221901.7 1674327 1614426 1765870 151444.30 2404866 1595935
# SC0345    1684606 245318.9 1641650 1580413 1688573 108160.19 2415358 1458647
# VA0031    1705482 241826.6 1677447 1577802 1737004 159201.62 2378423 1470841







# Subset the data by each Month
M1 <- Sales[ Sales$Month == 1, c(1, 3 ) ]
M2 <- Sales[ Sales$Month == 2, c(1, 3 ) ]
M3 <- Sales[ Sales$Month == 3, c(1, 3 ) ]
M4 <- Sales[ Sales$Month == 4, c(1, 3 ) ]
M5 <- Sales[ Sales$Month == 5, c(1, 3 ) ]
M6 <- Sales[ Sales$Month == 6, c(1, 3 ) ]
M7 <- Sales[ Sales$Month == 7, c(1, 3 ) ]
M8 <- Sales[ Sales$Month == 8, c(1, 3 ) ]
M9 <- Sales[ Sales$Month == 9, c(1, 3 ) ]
M10 <- Sales[ Sales$Month == 10, c(1, 3 ) ]
M11 <- Sales[ Sales$Month == 11, c(1, 3 ) ]
M12 <- Sales[ Sales$Month == 12, c(1, 3 ) ]

# Changed the name of column to reflect the sample Months
names( M1 )[2] <- "Revenue1"
names( M2 )[2] <- "Revenue2"
names( M3 )[2] <- "Revenue3"
names( M4 )[2] <- "Revenue4"
names( M5 )[2] <- "Revenue5"
names( M6 )[2] <- "Revenue6"
names( M7 )[2] <- "Revenue7"
names( M8 )[2] <- "Revenue8"
names( M9 )[2] <- "Revenue9"
names( M10 )[2] <- "Revenue10"
names( M11 )[2] <- "Revenue11"
names( M12 )[2] <- "Revenue12"

# Converting dataset from long to wide
sales1 <- merge( M1, M2, By = "Store")
sales2 <- merge( sales1, M3, By = "Store")
sales3 <- merge( sales2, M4, By = "Store")
sales4 <- merge( sales3, M5, By = "Store")
sales5 <- merge( sales4, M6, By = "Store")
sales6 <- merge( sales5, M7, By = "Store")
sales7 <- merge( sales6, M8, By = "Store")
sales8 <- merge( sales7, M9, By = "Store")
sales9 <- merge( sales8, M10, By = "Store")
sales10 <- merge( sales9, M11, By = "Store")
storesales <- merge( sales10, M12, By = "Store")

#Wide dataset
View(storesales)


