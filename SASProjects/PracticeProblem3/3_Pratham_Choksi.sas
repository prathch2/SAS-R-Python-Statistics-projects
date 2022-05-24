*Pratham Choksi;
*2/9/2022;

PROC IMPORT OUT= WORK.Rxdata 
            DATAFILE= "C:\Users\prath\OneDrive\Desktop\COMPUTER SCIENCE\
stats321\RXData2.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

* Creates a new library
* LIBNAME SASDATA 'C:\Users\prath\Documents';

*These lines of code create separate datasets for each s variable, which will then be combined to form a long dataset;
DATA rxdata1;
	set rxdata;
	S = S1;
	Time = 1;
	DROP S1 S2 S3;
RUN;

DATA rxdata2;
	set rxdata;
	S = S2;
	Time = 2;
	DROP S1 S2 S3;
RUN;

DATA rxdata3;
	set rxdata;
	S = S3;
	Time = 3;
	DROP S1 S2 S3;
RUN;

*This converts the dataset from wide to long;
DATA rxdata_Long;
	SET rxdata1 rxdata2 rxdata3;
RUN;




*Analysis of Variance... ANOVA;

*We want to be able to see if there are differences in the data;
*Did any of the treatment work? N = none, C = ?, L = Lowercaserin;

*This makes the picture for S1; 
PROC SORT data = rxdata;
	BY TRT;
RUN;

PROC Boxplot data = rxdata;
	PLOT S1*TRT;
RUN;

*For S2;
PROC SORT data = rxdata;
	BY TRT;
RUN;

PROC Boxplot data = rxdata;
	PLOT S2*TRT;
RUN;

*For S3;
PROC SORT data = rxdata;
	BY TRT;
RUN;

PROC Boxplot data = rxdata;
	PLOT S3*TRT;
RUN;




* If you have several groups and wish to know if there are differences
* in mean response across the groups. .

* Use an ANALYSIS of Variance Test... ANOVA; 
* Define the variables 
* muL = mean impulsivity of Lorcaserin 
* muC = mean impulsivity of C 
* muN = mean impulsivity of None; 
* Hypothesis: 
* H0: muL = muC = muN: 
* HA: At least two means differ

* Significance level: alpha = 0.073;
* Test statistic: PROC GLM in SAS (F-value and p-value);
* Decision Rule: If p-value < alpha reject H0;
PROC GLM data =  rxdata; 
	CLASS TRT; 
	MODEL S1 = TRT;
RUN;
* Source          DF        Sum of squares     Mean Square     F Value     Pr > F
* Model           3         7.0477273          2.3492424       0.53       0.6627
* Error           36        158.7272727       4.4090909        
*Corrected Total  39        165.7750000
* F-value is a Signal to Noise Ratio.
* Bigger number means more signal than noise: 
* F-value = 1 means signal and noise are equal; 
* F-value < 1 means more noise than signal; 
* Decision: Since p-value = 0.6627 > 0.073 = alpha we fail to reject HO; 
* Conclusion: We have insufficient evidence to claim that differences exist across treatment at time l;

******************************************************************************************************************************************************

* Define the variables 
* muL = mean impulsivity of Lorcaserin 
* muC = mean impulsivity of C 
* muN = mean impulsivity of None; 
* Hypothesis: 
* H0: muL = muC = muN: 
* HA: At least two means differ

* Significance level: alpha = 0.073;
* Test statistic: PROC GLM in SAS (F-value and p-value);
* Decision Rule: If p-value < alpha reject H0;
PROC GLM data =  rxdata; 
	CLASS TRT; 
	MODEL S2 = TRT;
RUN;
* Source          DF        Sum of squares     Mean Square     F Value     Pr > F
* Model           3         273.5636364         91.1878788       15.20       <.0001
* Error           36        216.0363636       6.0010101        
*Corrected Total  39        489.6000000
* F-value is a Signal to Noise Ratio.
* Bigger number means more signal than noise: 
* F-value = 1 means signal and noise are equal; 
* F-value < 1 means more noise than signal; 
* Decision: Since p-value = <.0001 < 0.073 = alpha we reject HO; 
* Conclusion: We have sufficient evidence to claim that differences exist across treatment at time 2;

******************************************************************************************************************************************************

* Define the variables 
* muL = mean impulsivity of Lorcaserin 
* muC = mean impulsivity of C 
* muN = mean impulsivity of None; 
* Hypothesis: 
* H0: muL = muC = muN: 
* HA: At least two means differ

* Significance level: alpha = 0.073;
* Test statistic: PROC GLM in SAS (F-value and p-value);
* Decision Rule: If p-value < alpha reject H0;
PROC GLM data =  rxdata; 
	CLASS TRT; 
	MODEL S3 = TRT;
RUN;
* Source          DF        Sum of squares     Mean Square     F Value     Pr > F
* Model           3         223.1363636         74.3787879       19.51       <.0001
* Error           36        137.2386364       3.8121843        
*Corrected Total  39        360.3750000
* F-value is a Signal to Noise Ratio.
* Bigger number means more signal than noise: 
* F-value = 1 means signal and noise are equal; 
* F-value < 1 means more noise than signal; 
* Decision: Since p-value = <.0001 < 0.073 = alpha we reject HO; 
* Conclusion: We have sufficient evidence to claim that differences exist across treatment at time 3;




* The ANOVA test only tells you if there are differences not which means are different; 

* If there are differences you can use a post hoc test.. Tukey's HSD; 


* Tukey's HD = Honestly Significant Difference; 
* What do we mean by Honest? What is dishonest about a t-test in this case? 



* Suppose we have k groups (k = 4 in our case ), to look at all pairwise comparisons there are k(k-1)/2 possible t-tests: 

* k = 2 => One comparision
* k = 3 => 3(2)/2 => three comparisions...AB, BC, AC. 
******** k = 4 => 4(3)/2 => six comparisions... ******
* k = 5 => 5(4)/2 Ten comparisons.. 

* k = 10 => 10(9)/2 => 45 comparisons...

* For any alpha for each t-test then the probability 
* that at least one of the t-tests has a type I error is
* P(At least one type one error)= 1 - (1 - alpha)^(k(k-1)/2) 

*alpha = 0.05, k = 5 
*1 - (1 - 0.05)^10 = 0.40126306076;

*alpha = 0.05, k = 10
*1 - (1 - 0.05)^45 = 0.90055974301;


* alpha = 0.05, k = 4 
*1 - (1 - 0.05)^6 = 0.26490810937; 
*There is a 26% chance that at least one of the t-test is wrong;
*Multiple comparisions tests leads tio a false type 1 error rate;

PROC GLM data = rxdata; 
	CLASS TRT;
	MODEL S1 = TRT;
	LSMEANS TRT / adjust = TURKEY;
RUN;

*In this case there are no differences from the ANOVA test... So Turkey's HSD is not needed.
*No need to look for differences that are not there.;
