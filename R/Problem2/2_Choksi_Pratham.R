#################################################################
#
# Project 5 - Pratham Choksi
#
#################################################################
setwd("C:/TempData")


S1 <- read.csv( "Site1.csv", header = TRUE )
S2 <- read.csv( "Site2.csv", header = TRUE )
S3 <- read.csv( "Site3.csv", header = TRUE )
S4 <- read.csv( "Site4.csv", header = TRUE )
S5 <- read.csv( "Site5.csv", header = TRUE )

#create one whole dataset
Impulsivity <- rbind( S1, S2, S3, S4, S5)

#Subset the data for treatment
TRTN <- Impulsivity[ Impulsivity$TRT == "N", ]

TRTL <- Impulsivity[ Impulsivity$TRT == "L", ]

TRTC <- Impulsivity[ Impulsivity$TRT == "C", ]


hist(TRTN$Age,
     xlab = "Age",  #x-label
     main = "Histogram of Age for N TRT"  #title
)
# center about 37
# spread: from 20 to 55
# shape: bimodal
# unusual features: none

hist(TRTL$Age,
     xlab = "Age",  #x-label
     main = "Histogram of Age for L TRT"  #title
)
# center about 42
# spread: from 20 to 55
# shape: skewed left/bimodal
# unusual features: none

hist(TRTC$Age,
     xlab = "Age",  #x-label
     main = "Histogram of Age for C TRT"  #title
)
# center about 40
# spread: from 20 to 55
# shape: skewed left/bimodal
# unusual features: none


#Subset the data for Gender
Male <- Impulsivity[ Impulsivity$Gender == "M", ]

Female <- Impulsivity[ Impulsivity$Gender == "F", ]

hist(Male$Age,
     xlab = "Age",  #x-label
     main = "Histogram of Age for Males"  #title
)
# center about 40
# spread: from 20 to 55
# shape: skewed left/bimodal
# unusual features: none


hist(Female$Age,
     xlab = "Age",  #x-label
     main = "Histogram of Age for Females"  #title
)
# center about 38
# spread: from 20 to 55
# shape: skewed left
# unusual features: none



boxplot( Impulsivity$Imp1,
         Impulsivity$Imp2,
         Impulsivity$Imp3,
         Impulsivity$Imp4,
         Impulsivity$Imp5,
         main = "Impulsivity for each Visit time",
         xlab = "Visit Time",
         names = c("Imp1", "Imp2", "Imp3", "Imp4", "Imp5"),
         ylab = "Impulsivity")
# Imp1 ->
#center about 72
# spread: from 65 to 77.5
# shape: slightly skewed to left
# unusual features: outlier at 79

# Imp2 ->
# center about 67.5
# spread: from 62 to 77
# shape: slightly skewed right
# unusual features: outlier at 78 and at 59

# Imp3 ->
# center about 65
# spread: from 59 to 74
# shape: slightly skewed right
# unusual features: outlier at 57

# Imp4 ->
# center about 65
# spread: from 58 to 73
# shape: symmetric
# unusual features: none

# Imp5 ->
# center about 62
# spread: from 53 to 68
# shape: symmetric
# unusual features: outlier at 71


boxplot( TRTC$Imp1,
         TRTL$Imp1,
         TRTN$Imp1,
         main = "Imp1 for each TRT",
         xlab = "Treatments",
         names = c("TRTC", "TRTL", "TRTN"),
         ylab = "Impulsivity")
# TRTC ->
# center about 72
# spread: from 66 to 76
# shape: Skewed to the left
# unusual features: outlier at 79

# TRTL ->
# center about 72
# spread: from 66 to 77
# shape: Slightly skewed to left
# unusual features: outlier at 77.5 and 65

# TRTN ->
# center about 72
# spread: from 67 to 76
# shape: Skewed to the left
# unusual features: none

boxplot( TRTC$Imp2,
         TRTL$Imp2,
         TRTN$Imp2,
         main = "Imp2 for each TRT",
         xlab = "Treatments",
         names = c("TRTC", "TRTL", "TRTN"),
         ylab = "Impulsivity")
# TRTC ->
# center about 68
# spread: from 61 to 75
# shape: Slightly skewed to the right
# unusual features: none

# TRTL ->
# center about 68
# spread: from 63 to 73
# shape: skewed to left
# unusual features: none

# TRTN ->
# center about 68
# spread: from 63 to 77
# shape: Skewed to the right
# unusual features: outlier at 78 and 58

boxplot( TRTC$Imp3,
         TRTL$Imp3,
         TRTN$Imp3,
         main = "Imp3 for each TRT",
         xlab = "Treatments",
         names = c("TRTC", "TRTL", "TRTN"),
         ylab = "Impulsivity")
# TRTC ->
# center about 65
# spread: from 60 to 74
# shape: skewed to the right
# unusual features: none

# TRTL ->
# center about 65
# spread: from 58 to 73
# shape: symmeteric
# unusual features: outlier at 55

# TRTN ->
# center about 65
# spread: from 58 to 74
# shape: Skewed to the right
# unusual features: none

boxplot( TRTC$Imp4,
         TRTL$Imp4,
         TRTN$Imp4,
         main = "Imp4 for each TRT",
         xlab = "Treatments",
         names = c("TRTC", "TRTL", "TRTN"),
         ylab = "Impulsivity")
# TRTC ->
# center about 65
# spread: from 58 to 72
# shape: symmeteric
# unusual features: none

# TRTL ->
# center about 65
# spread: from 58 to 71
# shape: skewed to the left
# unusual features: none

# TRTN ->
# center about 65
# spread: from 57 to 71
# shape: Symmeteric
# unusual features: none


boxplot( TRTC$Imp5,
         TRTL$Imp5,
         TRTN$Imp5,
         main = "Imp5 for each TRT",
         xlab = "Treatments",
         names = c("TRTC", "TRTL", "TRTN"),
         ylab = "Impulsivity")
# TRTC ->
# center about 62
# spread: from 55 to 66
# shape: skewed to the left
# unusual features: outlier at 67

# TRTL ->
# center about 60
# spread: from 51 to 67
# shape: symmetric
# unusual features: none

# TRTN ->
# center about 65
# spread: from 51 to 67
# shape: Symmetric
# unusual features: none



boxplot( Male$Imp1,
         Female$Imp1,
         main = "Imp1 for each Gender",
         xlab = "Gender",
         names = c("Male", "Female"),
         ylab = "Impulsivity")
# Male ->
# center about 72
# spread: from 65 to 79
# shape: symmetric
# unusual features: none

# Female ->
# center about 72
# spread: from 68 to 76
# shape: symmetric
# unusual features: outliers at 77, 78, 79, 66, 67

boxplot( Male$Imp2,
         Female$Imp2,
         main = "Imp2 for each Gender",
         xlab = "Gender",
         names = c("Male", "Female"),
         ylab = "Impulsivity")
# Male ->
# center about 68
# spread: from 63 to 74
# shape: skewed to right
# unusual features: outliers 62, 75, 77

# Female ->
# center about 68
# spread: from 62 to 73
# shape: skweed to the left
# unusual features: outliers at 59, 61, 75, 76

boxplot( Male$Imp3,
         Female$Imp3,
         main = "Imp3 for each Gender",
         xlab = "Gender",
         names = c("Male", "Female"),
         ylab = "Impulsivity")
# Male ->
# center about 65
# spread: from 58 to 74
# shape: symmetric
# unusual features: none

# Female ->
# center about 65
# spread: from 58 to 74
# shape: symmetric
# unusual features: outliers at 56

boxplot( Male$Imp4,
         Female$Imp4,
         main = "Imp4 for each Gender",
         xlab = "Gender",
         names = c("Male", "Female"),
         ylab = "Impulsivity")
# Male ->
# center about 65
# spread: from 58 to 71
# shape: symmetric
# unusual features: none

# Female ->
# center about 65
# spread: from 58 to 72
# shape: symmetric
# unusual features: none


boxplot( Male$Imp5,
         Female$Imp5,
         main = "Imp5 for each Gender",
         xlab = "Gender",
         names = c("Male", "Female"),
         ylab = "Impulsivity")
# Male ->
# center about 60
# spread: from 53 to 67
# shape: symmetric
# unusual features: none

# Female ->
# center about 60
# spread: from 52 to 67
# shape: symmetric
# unusual features: none
