PROC IMPORT OUT= WORK.FLU 
            DATAFILE= "C:\Users\prath\OneDrive\Desktop\COMPUTER SCIENCE\
stats321\flu1.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

*Overall Scatterplot;
PROC PLOT DATA = flu;
	PLOT incidence*temp;
RUN;
*The Overall scatterplot:
Strong, positive, nonlinear association between the two variables is shown with this scatterplot;


PROC GPLOT DATA = flu;
	PLOT incidence*temp;
RUN;
QUIT;
*Direction - positive
Strength - Strong
Form - nonlinear;


*This is the modern version of plotting;
PROC SGPLOT DATA = flu;
	scatter y = incidence x = temp;
RUN;
QUIT;
*Direction - positive
Strength - Strong
Form - nonlinear;

*This is a scatterplot but with modified colors for eact region for better readability;
PROC SGPLOT DATA = flu;
	scatter y = incidence x = temp / group=region;
RUN;
QUIT;


*Linear Regression Model;
*Goal Fit:
*
*y = b0 + b1*x
*b1 is the slope
*b0 is the y-intercept

*Regression will give us the line of best (least squares) fit;
*Meaning line with the least vertical distance from the points;

*For fitting an overall regression line...;
PROC REG data = flu;
	MODEL incidence = temp;
RUN;
QUIT;
* Intercept: -0.71212;
* Slope: 0.06239;

* The Slope means...
* For every temp increase, we expect influenza incidence to increase 0.06239 times;

* The Intercept means...
* If temp = 0, we would expect influenza incidences to be -0.71212.
* Meaning influenza cases are negative at temperature zero. You can't have a negative incidence.
* Dont interpret unless x data span 0;

* Predict 


* R^2 value is: 0.7944;
* The R^2 means the regression line explains 79.44% of the variation in y (incidence).

*Our line is: 
* incidence = -0.71212 + 0.06239*Temp;

*Using this line we can make predictions:

*Predict: 

*Temp 20.7 -> 0.579353   actual -> 0.41
*Temp 8.6 -> -0.175566   actual -> 0.12
*Temp 16.5 -> 0.317315    actual -> 0.25

*X intercept:
*X = -0.71212/0.06239 = -11.414;
*This makes sense! At y=0, meaning when there are no incidences, the temperature is -11.414 degrees celcius.

* Hypothesis test
* Parameter = b1 (Slope) ;
* Hypothesis;
* HO: b1           y = b0 + 0*x = bO;
* HA: bl=/=0;
* Significance level: alpha = 0.09:
*Test Statistic;
PROC REG data = flu;
	MODEL incidence = temp;
RUN;
QUIT;
* Decision Rule:
If p-value < alpha reject H0;
* Execute:
*  Var      df       Estimate   StdError   T-val   p-val
*  Temp     1        0.10723    0.00790    13.58   <.0001
* Decision:Since p-value < 0.0001 < 0. 09 alpha we reject H0;
* Conclusion: We have sufficient evidence to claim that
the slope is not equat to 0, meaning incidences increase or decrease across temperature (on average) .;


*Hypothesis test on b0?
* b0 = 0 -> the incidences are 0 at temperature 0;
* This makes sense and can be useful;
* Hypothesis test
* Parameter = b0 (Intercept) ;
* Hypothesis;
* HO: b0           y = b0 + 0*x = bO;
* HA: b0=/=0;
* Significance level: alpha = 0.09:
*Test Statistic;
PROC REG data = flu;
	MODEL incidence = temp;
RUN;
QUIT;
* Decision Rule:
If p-value < alpha reject H0;
* Execute:
*  Var      df       Estimate   StdError   T-val   p-val
*  Temp     1        0.10723    0.00790    13.58   <.0001
* Decision:Since p-value < 0.0001 < 0.09 alpha we reject H0;
* Conclusion: We have sufficient evidence to claim that the incidences are not 0 at temperature 0;



*This subsets the data for southwest;
DATA Southwestflu;
	SET flu;
	WHERE Region = "Southwest";
	RUN;
PROC REG data = Southwestflu;
	MODEL incidence = temp;
RUN;
QUIT;
* R^2 value is: 0.8521;
* The R^2 means the regression line explains 85.21% of the variation in y (incidence).;



*This subsets the data for northeast;
DATA Northeastflu;
	SET flu;
	WHERE Region = "Northeast";
	RUN;
PROC REG data = Northeastflu;
	MODEL incidence = temp;
RUN;
QUIT;
* R^2 value is: 0.9163;
* The R^2 means the regression line explains 91.63% of the variation in y (incidence).;



*This subsets the data for northwest;
DATA Northwestflu;
	SET flu;
	WHERE Region = "Northwest";
	RUN;
PROC REG data = Northwestflu;
	MODEL incidence = temp;
RUN;
QUIT;
* R^2 value is: 0.8801;
* The R^2 means the regression line explains 88.01% of the variation in y (incidence).;


*This subsets the data for UpperMidWest;
DATA UpperMidWestflu;
	SET flu;
	WHERE Region = "UpperMidWest";
	RUN;
PROC REG data = UpperMidWestflu;
	MODEL incidence = temp;
RUN;
QUIT;
* R^2 value is: 0.8079;
* The R^2 means the regression line explains 80.79% of the variation in y (incidence).;


*This subsets the data for LowerMidWest;
DATA LowerMidWestflu;
	SET flu;
	WHERE Region = "LowerMidWest";
	RUN;
PROC REG data = LowerMidWestflu;
	MODEL incidence = temp;
RUN;
QUIT;
* R^2 value is: 0.8241;
* The R^2 means the regression line explains 82.41% of the variation in y (incidence).;
