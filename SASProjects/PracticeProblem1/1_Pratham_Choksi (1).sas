* Pratham Choksi;
* V00922278;
* 1/28/2022;

*Creates a new dataset with the data;
DATA Zynipheron;
INPUT SampleID $ Sex $ Treatment $ Age Score1 Score2 Score3;
Datalines;
M100051 M Z 35 28 27 23
M100055 F P 44 34 35 33
M100057 M P 48 31 32 29
M100079 F Z 42 25 27 24
R100059 F P 21 34 33 32
R100064 F Z 38 28 26 24
C100074 F Z 32 27 23 22
C100089 M P 26 34 30 33
M100094 M P 29 31 32 32
M100097 F Z 41 27 25 27
M100106 M Z 26 24 25 29
R100111 F Z 48 28 26 27
R100112 M Z 46 25 24 26
M100114 M Z 41 25 27 27
C100175 F P 45 35 31 30
C100182 F P 22 31 30 29
C100188 M Z 47 30 25 26
C100198 M Z 42 24 25 22
C100209 M P 49 31 33 30
C100247 F Z 26 27 28 26
R100264 F Z 28 26 25 22
R100279 F Z 43 24 24 25
R100345 M P 44 36 30 30
R100489 M Z 50 23 27 21
C100477 F P 27 31 30 33
;
RUN;

*This subsets the data for Placebo;
DATA ZynipheronTreatmentNot;
	SET Zynipheron;
	WHERE treatment = "P";
	RUN;
*This subsets the data for Zynpheron;
DATA ZynipheronTreatment;
	SET Zynipheron;
	WHERE treatment = "Z";
	RUN;

*This subsets the data for Male;
DATA ZynipheronM;
	SET Zynipheron;
	WHERE sex = "M";
	RUN;
*This subsets the data for Female;
DATA ZynipheronF;
	SET Zynipheron;
	WHERE sex = "F";
	RUN;


*Below is the basic summaries for each of the five datasets for glucose variable;




*Mean for score1: 28.76
*Mean for Score2: 28.0
*Mean for score3: 27.28;
PROC MEANS DATA = Zynipheron;
VAR Score1 Score2 Score3;
RUN;

*Mean for score1: 32.8
*Mean for Score2: 31.6
*Mean for score3: 31.1;
PROC MEANS DATA = ZynipheronTreatmentNot;
VAR Score1 Score2 Score3;
RUN;

*Mean for score1: 26.0666667
*Mean for Score2: 25.6
*Mean for score3: 24.7333333;
PROC MEANS DATA = ZynipheronTreatment;
VAR Score1 Score2 Score3;
RUN;

*Mean for score1: 28.5
*Mean for Score2: 28.0833333
*Mean for score3: 27.3333333;
PROC MEANS DATA = ZynipheronM;
VAR Score1 Score2 Score3;
RUN;

*Mean for score1: 29.0
*Mean for Score2: 27.9230769
*Mean for score3: 27.2307692;
PROC MEANS DATA = ZynipheronF;
VAR Score1 Score2 Score3;
RUN;






* PROC TTEST FOR TREATMENT:
* Determine if the treatment causes statistically different mean responses for blood glucose;

* Analysis 1 - 
* muP = mean blood glucose score before Placebo treatment;
* muZ = mean blood glucose score before Zynipheron treatment;
* H0: muP = muZ;
* HA: muP =/= muZ;
* Significance Level: alpha = 0.035;

* Test Statistic: PROC TTEST in SAS;
* Decision: if p-value < alpha reject H0 in favor of HA.
* Execute;

PROC TTEST data = Zynipheron;
	CLASS Treatment;
	VAR Score1;
RUN;
*                                 DF    t-val   p-value;
* Satterthwaite Unequal        19.389   8.31   <.0001;
* Decision: Since p-value = <0.001 < 0.035 = alpha we reject HO!;
* Conclusion: We have sufficient evidence to claim the mean blood glucose score before Placebo 
* treatment is different from the mean blood glucose score before Zynipheron treatment;


* Analysis 2 - 
* muP = mean blood glucose score one week after Placebo treatment;
* muZ = mean blood glucose score one week after Zynipheron treatment;
* H0: muP = muZ;
* HA: muP =/= muZ;
* Significance Level: alpha = 0.035;

* Test Statistic: PROC TTEST in SAS;
* Decision: if p-value < alpha reject H0 in favor of HA.
* Execute;

PROC TTEST data = Zynipheron;
	CLASS Treatment;
	VAR Score2;
RUN;
*                                 DF    t-val   p-value;
* Satterthwaite Unequal        16.715   9.21   <.0001;
* Decision: Since p-value = <0.001 < 0.035 = alpha we reject HO!;
* Conclusion: We have sufficient evidence to claim the mean blood glucose score one week after Placebo 
* treatment is different from the mean blood glucose score one week after Zynipheron treatment;



* Analysis 3 - 
* muP = mean blood glucose score two week after Placebo treatment;
* muZ = mean blood glucose score two week after Zynipheron treatment;
* H0: muP = muZ;
* HA: muP =/= muZ;
* Significance Level: alpha = 0.035;

* Test Statistic: PROC TTEST in SAS;
* Decision: if p-value < alpha reject H0 in favor of HA.
* Execute;

PROC TTEST data = Zynipheron;
	CLASS Treatment;
	VAR Score3;
RUN;
*                                 DF    t-val   p-value;
* Satterthwaite Unequal        22.897   7.88   <.0001;
* Decision: Since p-value = <0.001 < 0.035 = alpha we reject HO!;
* Conclusion: We have sufficient evidence to claim the mean blood glucose score two week after Placebo 
* treatment is different from the mean blood glucose score two week after Zynipheron treatment;








* PROC TTEST FOR GENDER:
* determine if gender influences the mean response for each glucose measurement;

* Analysis 1 - 
* muM = mean blood glucose score for males before treatment;
* muF = mean blood glucose score for females before treatment;
* H0: muM = muF;
* HA: muM =/= muF;
* Significance Level: alpha = 0.045;

* Test Statistic: PROC TTEST in SAS;
* Decision: if p-value < alpha reject H0 in favor of HA.
* Execute;

PROC TTEST data = Zynipheron;
	CLASS Sex;
	VAR Score1;
RUN;
*                                 DF    t-val   p-value;
* Satterthwaite Unequal        21.652   0.31   0.7572;
* Decision: Since p-value = 0.7572 > 0.035 = alpha we fail to reject HO!;
* Conclusion: We have insufficient evidence to claim the mean blood glucose score for males before 
* treatment is different from the mean blood glucose score for females before treatment;


* Analysis 2 - 
* muM = mean blood glucose score for males one week after treatment;
* muF = mean blood glucose score for females one week after treatment;
* H0: muM = muF;
* HA: muM =/= muF;
* Significance Level: alpha = 0.045;

* Test Statistic: PROC TTEST in SAS;
* Decision: if p-value < alpha reject H0 in favor of HA.
* Execute;

PROC TTEST data = Zynipheron;
	CLASS Sex;
	VAR Score2;
RUN;
*                                 DF    t-val   p-value;
* Satterthwaite Unequal        22.937   -0.12   0.9075;
* Decision: Since p-value = 0.9075 > 0.035 = alpha we fail to reject HO!;
* Conclusion: We have insufficient evidence to claim the mean blood glucose score for males one week after 
* treatment is different from the mean blood glucose score for females one week after treatment;



* Analysis 3 - 
* muM = mean blood glucose score for males two week after treatment;
* muF = mean blood glucose score for females two week after treatment;
* H0: muM = muF;
* HA: muM =/= muF;
* Significance Level: alpha = 0.045;

* Test Statistic: PROC TTEST in SAS;
* Decision: if p-value < alpha reject H0 in favor of HA.
* Execute;

PROC TTEST data = Zynipheron;
	CLASS Sex;
	VAR Score3;
RUN;
*                                 DF    t-val   p-value;
* Satterthwaite Unequal        22.867   -0.07   0.9480;
* Decision: Since p-value = 0.9480 > 0.035 = alpha we fail to reject HO!;
* Conclusion: We have insufficient evidence to claim the mean blood glucose score for males two week after 
* treatment is different from the mean blood glucose score for females two week after treatment;




*****************************************************************************************************************************
* Assess our assumptions..;
*
* 1. Simple Random Sample?;
* 2. Approximately normal or sample size is big enough;
* 3. Equal Variances across groups...;


* For the last analysis.
* SRS? Must assume it. (Weakness)
* Approximately normal? Based off the QQplots the approximate normality assumption is valid.


* Statistical test?;
* Hypothesis:
* HO: Data are normal;
* HA: Data are not normal;
* Significance level: alpha = 0.001
* Test Statistic: PROC UNIVARIATE Shapiro-Wilk in SAS;
* Decision: If p-value < alpha then reject H0.;
* execute.;

PROC UNIVARIATE data = Zynipheron normal;
VAR Score1 Score2 Score3;
WHERE Sex = "M";
RUN;
* Shapiro-Wilk Score1:     W  0.918191     Pr<W  0.2713;
* Shapiro-Wilk Score2:     W  0.895866     Pr<W  0.1403;
* Shapiro-Wilk Score3:     W  0.950434     Pr<W  0.6433;
* Decision: Since p-value = 0.2713, 0.1403, 0.6433 > 0.001 = alpha we fail to reject H0;
* Conclusion: We have insufficient evidence to claim the Male Zynipheron data is not normal;


* Hypothesis:
* HO: Data are normal;
* HA: Data areynot normal;
* Significance level: alpha = 0.001
* Test Statistic: PROC UNIVARIATE Shapiro-Wilk in SAS;
* Decision: If p-value < alpha then reject H0.;
* execute.;
PROC UNIVARIATE data = Zynipheron normal;
VAR Score1 Score2 Score3;
WHERE Sex = "F";
RUN;
* Shapiro-Wilk Score1:     W  0.910261     Pr<W  0.1849;
* Shapiro-Wilk Score2:     W  0.947578     Pr<W  0.5621;
* Shapiro-Wilk Score3:     W  0.926957     Pr<W  0.3108;
* Decision: Since p-value = 0.1849, 0.5621, 0.3108 > 0.001 = alpha we fail to reject H0;
* Conclusion: We have insufficient evidence to claim the Female Zynipheron data is not normal;



* Hypothesis:
* HO: Data are normal;
* HA: Data areynot normal;
* Significance level: alpha = 0.001
* Test Statistic: PROC UNIVARIATE Shapiro-Wilk in SAS;
* Decision: If p-value < alpha then reject H0.;
* execute.;
PROC UNIVARIATE data = Zynipheron normal;
VAR Score1 Score2 Score3 ;
WHERE Treatment = "P";
RUN;
* Shapiro-Wilk Score1:     W  0.793858     Pr<W  0.0122;
* Shapiro-Wilk Score2:     W  0.866992     Pr<W  0.0922;
* Shapiro-Wilk Score3:     W  0.842258     Pr<W  0.0470;
* Decision: Since p-value = 0.0122, 0.0922, 0.0470 > 0.001 = alpha we fail to reject H0;
* Conclusion: We have insufficient evidence to claim the Placebo treatment Zynipheron data is not normal;


* Hypothesis:
* HO: Data are normal;
* HA: Data areynot normal;
* Significance level: alpha = 0.001
* Test Statistic: PROC UNIVARIATE Shapiro-Wilk in SAS;
* Decision: If p-value < alpha then reject H0.;
* execute.;
PROC UNIVARIATE data = Zynipheron normal;
VAR Score1 Score2 Score3;
WHERE Treatment = "Z";
RUN;
* Shapiro-Wilk Score1:     W  0.946313     Pr<W  0.4684;
* Shapiro-Wilk Score2:     W  0.939759     Pr<W  0.3794;
* Shapiro-Wilk Score3:     W  0.943159     Pr<W  0.4238;
* Decision: Since p-value = 0.4684, 0.3794, 0.4238 > 0.001 = alpha we fail to reject H0;
* Conclusion: We have insufficient evidence to claim the Zynipheron treatement Zynipheron data is not normal;
