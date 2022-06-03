# -*- coding: utf-8 -*-
"""
Created on Sat Apr 30 23:44:49 2022

@author: prath
"""

import os as os
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as st
import pandas as pd
import statsmodels.stats.anova as sma
import statsmodels.formula.api as smf
import statsmodels.stats.multicomp as smm
import statsmodels.api as sm

#Set working directory
os.chdir("/Users/prath/Desktop")

#Read in file
Employee = pd.read_csv("Employee.csv")

Employee.head()

Employee ['Rate'].describe()
# count    185.000000
# mean      29.516216
# std        7.155000
# min       15.250000
# 25%       24.250000
# 50%       28.000000
# 75%       34.750000
# max       46.500000

Employee ['MonthsEmp'].describe()
# count    185.000000
# mean      48.648649
# std       37.110013
# min        1.000000
# 25%       17.000000
# 50%       39.000000
# 75%       82.000000
# max      138.000000

plt.hist( Employee["MonthsEmp"] )
plt.show()
# Right Skewed
# Center: 48
# Spread: 0 to 140
# unusual features: bimodal 

Employee.groupby( ['Role'] ) ['Rate', 'MonthsEmp'].describe()
#                 Rate                              ... MonthsEmp                      
#                count       mean       std    min  ...       25%    50%     75%    max
# Role                                              ...                                
# Assistant Mgr   28.0  37.312500  1.351654  35.25  ...      81.0   90.0   97.25  102.0
# Manager         18.0  42.944444  2.165158  40.25  ...      99.5  119.5  127.75  138.0
# Staff          139.0  26.206835  4.521079  15.25  ...      12.0   26.0   45.00  100.0

plt.scatter( Employee["MonthsEmp"], Employee["Rate"] )
plt.show()
# Direction is positive
# form is linear
# strength is strong

# Fit a regression model
X = Employee['MonthsEmp']
Y = Employee['Rate']

#Build a model using ordinary Least Squares OLS
X = sm.add_constant(X)
model1 = sm.OLS( Y, X ).fit()

#Get the model summary
model1.summary()
#                             OLS Regression Results                            
# ==============================================================================
# Dep. Variable:                   Rate   R-squared:                       0.802
# Model:                            OLS   Adj. R-squared:                  0.801
# Method:                 Least Squares   F-statistic:                     742.6
# Date:                Mon, 02 May 2022   Prob (F-statistic):           2.53e-66
# Time:                        18:55:36   Log-Likelihood:                -476.11
# No. Observations:                 185   AIC:                             956.2
# Df Residuals:                     183   BIC:                             962.7
# Df Model:                           1                                         
# Covariance Type:            nonrobust                                         
# ==============================================================================
#                  coef    std err          t      P>|t|      [0.025      0.975]
# ------------------------------------------------------------------------------
# const         21.1147      0.387     54.507      0.000      20.350      21.879
# MonthsEmp      0.1727      0.006     27.251      0.000       0.160       0.185
# ==============================================================================
# Omnibus:                        1.645   Durbin-Watson:                   1.950
# Prob(Omnibus):                  0.439   Jarque-Bera (JB):                1.633
# Skew:                           0.155   Prob(JB):                        0.442
# Kurtosis:                       2.659   Cond. No.                         101.
# ==============================================================================

# Intepret the model coefficients:
# Constant is: "when MonthsEmp = 0 the Rate is 21? Nonsense
# Slope is: For every increase in Months Employed, we expect the Rate to increase by 0.17

Sales1 = pd.read_csv("TimeCard.csv")


plt.hist( Sales1["Hours"] )
plt.show()
# left Skewed
# Center: 38
# Spread: 28 to 40
# unusual features: none 

# Merging the two dataframes
Merge1 = pd.merge( Employee, Sales1, on = 'EmpID' )


data = [ Merge1.Hours[Merge1['Role'] == "Manager"],
         Merge1.Hours[Merge1['Role'] == "Assistant Mgr"],
         Merge1.Hours[Merge1['Role'] == "Staff"] ]
plt.boxplot( data, notch = True, vert = False )
# Manager Hours boxplot:
# left Skewed
# Center: 39
# Spread: 35 to 40
# unusual features: outlier at 33

# Assistant Manager Hours boxplot:
# Right Skewed
# Center: 38
# Spread: 37 to 40
# unusual features: outliers at 30, 35, 36

# Staff Hours boxplot:
# left Skewed
# Center: 38
# Spread: 34 to 40
# unusual features: outliers at 28, 29, 30, 31, 32, 33


# Define Anova problem:
# mu_Manager = mean hours for Managers
# mu_Assistant = mean hours for Assistant Managers
# mu_Staff = mean hours for Staff
# H0: mu_Manager = mu_Assistant = mu_Staff
# HA: At least two meand differ
# Significant level: alpha = 0.014
# Test Statistic: anova in statsmodels.stats
# Decision Rule: If p-value < alpha we reject H0
# Execute:
f1 ='Hours ~ Role'
f1_lm = smf.ols( f1, data = Merge1 ).fit()
sma.anova_lm( f1_lm )
#             df      sum_sq   mean_sq         F    PR(>F)
# Role        2.0   16.029652  8.014826  1.567723  0.211322
# Residual  182.0  930.456835  5.112400       NaN       NaN

# Decision: Since the p-value 0.211 > alpha we fail to reject H0.
# Conclusion: We have sufficient evidence to claim
# that mean hours does not differ across roles.

# Where are the differences?
# Since there are no differences, Turkey's post hoc test is not needed


