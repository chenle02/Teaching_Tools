#!/usr/bin/env lua

TOC = {}

local i=0
TOC[i] = {}
TOC[i]['Author'] = "Le Chen"
TOC[i]['Course_Name'] = "STAT 3610: Probability and Statistics II"
TOC[i]['Email'] = "le.chen@auburn.edu"
TOC[i]['University'] = "Auburn University"
TOC[i]['City'] = "Auburn, AL"
TOC[i]['Year_Season'] = "2021 Fall"


local i=1
TOC[i] = {}
TOC[i]['Chapter'] = "Chapter 6: Point Estimation"
TOC[i]['ChapterNum'] = 6
TOC[i]['Section'] = {}
TOC[i]['Section'][1] = "6.1 Descriptive Statistics"
TOC[i]['Section'][2] = "6.2 Exploratory Data Analysis"
TOC[i]['Section'][3] = "6.3 Order Statistics"
TOC[i]['Section'][4] = "6.4 Maximum Likelihood and Method of Moments Estimation"
TOC[i]['Section'][5] = "6.5 A Simple Regression Problem"
TOC[i]['Section'][6] = "6.6 Asymptotic Distributions of Maximum Likelihood Estimators"
TOC[i]['Section'][7] = "6.7 Sufficient Statistics"
TOC[i]['Section'][8] = "6.8 Bayesian Estimation"

i = i+1
TOC[i] = {}
TOC[i]['Chapter'] = "Chapter 7: Interval Estimation"
TOC[i]['ChapterNum'] = 7
TOC[i]['Section'] = {}
TOC[i]['Section'][1] = "7.1 Confidence Intervals for Means"
TOC[i]['Section'][2] = "7.2 Confidence Intervals for the Difference of Two Means"
TOC[i]['Section'][3] = "7.3 Confidence Intervals for Proportions"
TOC[i]['Section'][4] = "7.4 Sample Size"
TOC[i]['Section'][5] = "7.5 Distribution-Free Confidence Intervals for Percentiles"
TOC[i]['Section'][6] = "7.6 More Regression"
TOC[i]['Section'][7] = "7.7 Resampling Methods"

i = i+1
TOC[i] = {}
TOC[i]['Chapter'] = "Chapter 8: Tests of Statistical Hypothesis"
TOC[i]['ChapterNum'] = 8
TOC[i]['Section'] = {}
TOC[i]['Section'][1] = "8.1 Tests About One Mean"
TOC[i]['Section'][2] = "8.2 Tests of the Equality of Two Means"
TOC[i]['Section'][3] = "8.3 Test for Variances"
TOC[i]['Section'][4] = "8.4 Tests About Proportions"
TOC[i]['Section'][5] = "8.5 Some Distribution-Free Tests"
TOC[i]['Section'][6] = "8.6 Power of a Statistical Test"
TOC[i]['Section'][7] = "8.7 Best Critical Regions"
TOC[i]['Section'][8] = "8.8 Likelihood Ratio Test"

i = i+1
TOC[i] = {}
TOC[i]['Chapter'] = "Chapter 9: More Tests"
TOC[i]['ChapterNum'] = 9
TOC[i]['Section'] = {}
TOC[i]['Section'][1] = "9.1 Chi-Square Goodness-of-Fit Test"
TOC[i]['Section'][2] = "9.2 Contingency Tables"
TOC[i]['Section'][3] = "9.3 One-Factor Analysis of Variance"
TOC[i]['Section'][4] = "9.4 Two-Way Analysis of Variance"
TOC[i]['Section'][5] = "9.5 General Factorial and $2^k$ Factorial Designs"
TOC[i]['Section'][6] = "9.6 Tests Concerning Regression and Correlation"
TOC[i]['Section'][7] = "9.7 Statistical Quality Control"

loadfile("saveTable.lua")(TOC,"TOC.table")
