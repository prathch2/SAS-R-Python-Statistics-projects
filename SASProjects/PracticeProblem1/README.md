#Case Problem:
A researcher interested in impulsivity scores for patients in a clinical trial.  The trial is conducted at 3 sites, 
Cleveland (C), Minnesota (M), and Raleigh (R) and the participants Sex (M or F), Age and whether or not they 
received the Placebo (P) or the treatment Zynipheron (Z) are all recorded. The SampleID contains all of this 
information and can be decoded as C100072MZ corresponds to Cleveland site, Male who recieved Zynipheron.  In 
addition the researchers recorded Initial impulsivity score before treatment (Score1), Score one week after 
beginning treatment (Score2), two weeks after beginning treatment (Score3). The researcher has not entered the data 
into a computer and sends you the picture..

Tasks:

1.  Use a DATA step with the DATALINES statement to put the data into SAS.

2.  Create two subsets of the data one for  Treatment or not.

3.  Create two subsets of the data one for Male and one for Female. 

4.  Find basic summaries of each glucose variable for each of the five datasets. 

5.  Use PROC TTEST to determine if the treatment causes statistically different mean responses for blood glucose.  
Note this will involve three analyses, one at each time point.  Be sure to state the hypothesis, test statistic, 
decision rule, and conclusion for each of the analyses in the comments. Test using significance level alpha = 0.035.

6.  Use PROC TTEST to determine if gender influences the mean response for each glucose measurement.  
Again state the hypothesis, test statistic, decision rule and conclusion for each of the analyses 
in the comments. Test using alpha = 0.045. (40pts).

7.  Does it appear the assumptions for the tests are met?  Test the assumptions and put the results in the comments.
