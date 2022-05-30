#Pratham Choksi
#2/25/2022

#impulsivity data
drug1 <- c( "Repoxodin", "Repoxodin", "Repoxodin", "Repoxodin",
            "Repoxodin", "Repoxodin", "Repoxodin", "Repoxodin",
            "Repoxodin", "Repoxodin", "Repoxodin", "Repoxodin",
            "Repoxodin", "Repoxodin", "Repoxodin", "Repoxodin",
            "Repoxodin", "Control", "Control", "Control", "Control",
            "Control", "Control", "Control", "Control", "Control",
            "Control")

subjectNumber1 <- c("24", "25", "26", "27", "28", 
                    "29", "30", "31", "32", "33",
                    "34", "35", "36", "37", "38",
                    "39", "40", "01", "02", "03",
                    "04", "05", "06", "07", "08", 
                    "09", "10")

gender1 <- c("Female", "Male", "Female", "Male", "Male", "Female", "Female",
             "Male", "Male", "Female", "Female", "Female", "Male",
             "Male", "Female", "Male", "Male", "Female", "Female",
             "Male", "Male", "Female", "Male", "Female", "Male",
             "Female", "Male")

Time1 <- c(44, 42, 34, 45, 42, 37, 41, 42, 44, 
           43, 38, 42, 42, 48, 40, 41, 47, 59,
           58, 59, 54, 60, 62, 59, 53, 56, 57)

Time2 <- c(44, 44, 44, 42, 39, 44, 46, 47, 41,
           41, 45, 43, 43, 42, 37, 44, 42, 57,
           56, 66, 54, 57, 58, 56, 51, 59, 64)

Time3 <- c(48, 41, 44, 35, 44, 45, 46, 42, 38, 44,
           46, 46, 41, 42, 41, 43, 45, 62, 49, 64,
           59, 58, 64, 58, 52, 55, 61)

Time4 <- c(47, 44, 47, 44, 44, 38, 41, 41, 37, 49,
           43, 39, 46, 41, 41, 44, 40, 65, 51, 56,
           50, 64, 58, 63, 57, 55, 60)

#This creates the dataset for the impulsivity data
impulsivity <- data.frame( drug = drug1,
                           subjectNumber = subjectNumber1,
                           gender = gender1,
                           T1 = Time1,
                           T2 = Time2,
                           T3 = Time3,
                           T4 = Time4 )

#This creates the subsets for treatment or not
TRTr <- impulsivity[ impulsivity$drug == "Repoxodin", ]
TRTc <- impulsivity[ impulsivity$drug != "Repoxodin", ]

#This creates the subsets for the condition of which gender
GenderM <- impulsivity[ impulsivity$gender == "Male", ]
GenderF <- impulsivity[ impulsivity$gender == "Female", ]

#This is a summary function I created that provides a summary for any dataset
#plug in
Impsummary <- function( x1) {
  xmean1 <- mean(x1)  
  xsd1 <- sd(x1)   
  xmedian1 <- median(x1)  
  xq1 <- quantile( x1, 0.25 )    
  xq3 <- quantile( x1, 0.75)     
  xmax1 <- max( x1 )
  xmin1 <- min( x1 )
  output1 <- data.frame( mean = xmean1,  
                         sd = xsd1,    
                         median = xmedian1,
                         q1 = xq1,
                         q3 = xq3,    
                         max = xmax1,  
                         min = xmin1)
  return( output1 )
}


#These are the summaries of the impulsivity dataset 
Impsummary( impulsivity$T1)
# mean         sd        median  q1   q3   max  min
# 47.74074    8.396852     44    42   56.5  62  34
Impsummary( impulsivity$T2)
# mean         sd        median  q1   q3   max  min
# 48.37037  8.048641     44      42.5 56   66   37
Impsummary( impulsivity$T3)
# mean         sd        median  q1   q3   max  min
# 48.62963   8.422261     46    42.5  56.5  64  35
Impsummary( impulsivity$T4)
# mean         sd        median  q1   q3    max  min
# 48.33333    8.494342     46    41   55.5  65   37





#These are the summaries of the TRTr dataset 
Impsummary( TRTr$T1)
# mean         sd        median  q1   q3    max  min
# 41.88235    3.443878     42    41   44    48   34
Impsummary( TRTr$T2)
# mean         sd        median  q1   q3    max  min
# 42.82353    2.455486     43    42   44     47  37
Impsummary( TRTr$T3)
# mean         sd        median  q1   q3    max  min
# 43         3.221025     44    41   45     48  35
Impsummary( TRTr$T4)
# mean         sd        median  q1   q3    max  min
# 42.70588   3.368321     43     41   44     49  37





#These are the summaries of the TRTc dataset 
Impsummary( TRTc$T1)
# mean         sd        median  q1      q3    max  min
# 57.7     2.750757       58.5   56.25   59     62  53
Impsummary( TRTc$T2)
# mean         sd        median  q1   q3    max  min
# 57.8       4.417138     57    56   58.75  66  51
Impsummary( TRTc$T3)
# mean         sd        median  q1      q3    max  min
# 58.2        4.98442     58.5   55.75  61.75   64  49
Impsummary( TRTc$T4)
# mean         sd        median  q1      q3    max   min
# 57.9        5.173651   57.5   55.25  62.25    65   50





#These are the summaries of the GenderM dataset 
Impsummary( GenderM$T1)
# mean         sd        median  q1      q3    max  min
# 48.42857   7.208054     46     42     53.75  62  41
Impsummary( GenderM$T2)
# mean         sd        median  q1      q3    max  min
# 48.35714     8.85444     44    42      53.25  66  39
Impsummary( GenderM$T3)
# mean         sd        median  q1      q3    max  min
# 47.92857    10.02661   43.5   41.25    57.25  64  35
Impsummary( GenderM$T4)
# mean         sd        median  q1      q3    max  min
# 47.28571     7.5287     44     41.75   54.5  60  37





#These are the summaries of the GenderF dataset 
Impsummary( GenderF$T1)
# mean         sd        median  q1      q3    max  min
# 47          9.763879     43    40      58    60  34
Impsummary( GenderF$T2)
# mean         sd        median  q1      q3    max  min
# 48.38462   7.444668     45     44      56     59  37
Impsummary( GenderF$T3)
# mean         sd        median  q1      q3    max  min
# 49.38462   6.602253     46     45      55    62  41
Impsummary( GenderF$T4)
# mean         sd        median  q1      q3    max  min
# 49.46154   9.605687     47    41       55     65  38



# the rest of the code stacks the data frames for each of the dataset summaries
impulsivity.summary <- rbind( Impsummary(impulsivity$T1),
                              Impsummary(impulsivity$T2),
                              Impsummary(impulsivity$T3),
                              Impsummary(impulsivity$T4),
)

TRTr.summary <- rbind( Impsummary(TRTr$T1),
                              Impsummary(TRTr$T2),
                              Impsummary(TRTr$T3),
                              Impsummary(TRTr$T4)
)

TRTc.summary <- rbind( Impsummary(TRTc$T1),
                              Impsummary(TRTc$T2),
                              Impsummary(TRTc$T3),
                              Impsummary(TRTc$T4)
)

GenderM.summary <- rbind( Impsummary(GenderM$T1),
                              Impsummary(GenderM$T2),
                              Impsummary(GenderM$T3),
                              Impsummary(GenderM$T4)
)

GenderF.summary <- rbind( Impsummary(GenderF$T1),
                              Impsummary(GenderF$T2),
                              Impsummary(GenderF$T3),
                              Impsummary(GenderF$T4)
)

#Exports the datasets into excel files
write.xlsx( impulsivity.summary, "C:/Users/prath/desktop/impulsivitysummary.xlsx")
write.xlsx( TRTr.summary, "C:/Users/prath/desktop/TRTrsummary.xlsx")
write.xlsx( TRTc.summary, "C:/Users/prath/desktop/TRTcsummary.xlsx")
write.xlsx( GenderM.summary, "C:/Users/prath/desktop/GenderMsummary.xlsx")
write.xlsx( GenderF.summary, "C:/Users/prath/desktop/GenderFsummary.xlsx")
