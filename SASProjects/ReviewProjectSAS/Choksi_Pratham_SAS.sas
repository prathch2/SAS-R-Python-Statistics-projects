* Pratham Choksi
* 2/16/2022;

*Reads in the Employee.csv datafile into a dataset named Employee in the work library;
PROC IMPORT OUT= WORK.Employee 
            DATAFILE= "C:\Users\prath\OneDrive\Desktop\COMPUTER SCIENCE\
stats321\Employee.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

* This gives a summary of the rate variable;
PROC UNIVARIATE DATA = Employee;
	VAR Rate;
RUN;

* This gives a summary of the MonthEmp variable;
PROC UNIVARIATE DATA = Employee;
	VAR MonthsEmp;
RUN;

* This creates a histogram of MonthsEmp;
PROC UNIVARIATE DATA = Employee;
	VAR MonthsEmp;
	HISTOGRAM;
RUN;
*The histogram seems bimodal with it skewed to the right;


* This creates a summary of rate and MonthsEmp grouped by Role;
PROC UNIVARIATE DATA = Employee;
	CLASS Role;
	VAR Rate MonthsEmp;
RUN;

* This creates a scatterplot of Rate vs MonthEmp;
PROC SGPLOT DATA = Employee;
	scatter y = Rate x = MonthsEmp;
RUN;
QUIT;
*Direction - positive
*Strength - moderate
*Form - linear;



*Linear Regression Model - to interpret the regression coeficients of Rate vs MonthsEmp;
*Goal Fit:
*
*y = b0 + b1*x
*b1 is the slope
*b0 is the y-intercept

*Regression will give us the line of best (least squares) fit;
*Meaning line with the least vertical distance from the points;

*For fitting an overall regression line...;
PROC REG data = Employee;
	MODEL Rate = MonthsEmp;
RUN;
QUIT;
* Intercept: 21.11473;
* Slope: 0.17270;

* The Slope means...
* For every MonthsEmp increase, we expect Rate to increase 0.17270 times;

* The Intercept means...
* If MonthsEmp = 0, we would expect Rate to be 21.11473.
* Meaning rate is positive at zero MonthsEmp. You can't have a positive rate when Months Employed is 0.
* Dont interpret unless x data span 0;

* Predict 


* R^2 value is: 0.8023;
* The R^2 means the regression line explains 80.23% of the variation in y.

*Our line is: 
* Rate = 21.11473 + 0.17270*MonthsEmp;

*X intercept:
*X = 21.11473/0.17270 = 122.2625;
*At y=0, the MonthsEmp is 122.2625.

* Hypothesis test
* Parameter = b1 (Slope) ;
* Hypothesis;
* HO: b1           y = b0 + 0*x = bO;
* HA: bl=/=0;
* Significance level: alpha = 0.09:
*Test Statistic;
PROC REG data = Employee;
	MODEL Rate = MonthsEmp;
RUN;
QUIT;
* Decision Rule:
If p-value < alpha reject H0;
* Execute:
*  Var           df       Estimate   StdError   T-val   p-val
*  MonthsEmp     1        0.17270    0.00634    27.25   <.0001
* Decision:Since p-value < 0.0001 < 0. 09 alpha we reject H0;
* Conclusion: We have sufficient evidence to claim that
the slope is not equal to 0, meaning Rate increase or decrease across MonthsEmp (on average) .;



*Reads in the TimeCard.csv datafile into a dataset named Sales1 located in work library;
PROC IMPORT OUT= WORK.States1 
            DATAFILE= "C:\Users\prath\OneDrive\Desktop\COMPUTER SCIENCE\
stats321\TimeCard.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

* Histogram of Hours;
PROC UNIVARIATE DATA = States1;
	VAR Hours;
	HISTOGRAM;
RUN;
*The histogram is skewed to the left;

*This code creates two tables, one with common assault and one with aggravated assault then I combined the two to be both in one table;
PROC SQL;
	CREATE TABLE WORK.States AS
	SELECT EmpID AS ID, Hours AS hours
	FROM WORK.States1;


	CREATE TABLE WORK.Employers AS
	SELECT EmpID AS ID, Role AS role
	FROM WORK.Employee;


	CREATE TABLE WORK.StateEmp AS
	SELECT  a.ID, 
			a.hours AS Hours, 
			b.role AS Role
	FROM WORK.States AS a,
		 WORK.Employers AS b
	WHERE a.ID = b.ID;
QUIT;

PROC SORT DATA = StateEmp;
	BY Role;
RUN;

*Creates a boxplot for hours vs roles;
PROC BOXPLOT DATA = StateEmp;
	Plot Hours*Role;
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
PROC GLM data =  StateEmp; 
	CLASS Role; 
	MODEL Hours = Role;
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

PROC GLM data = StateEmp; 
	CLASS Role;
	MODEL Hours = Role;
	LSMEANS Role / adjust = TURKEY;
RUN;

*In this case there are no differences from the ANOVA test... So Turkey's HSD is not needed.
*No need to look for differences that are not there.;
