# MechaCar_Statistical_Analysis

## Auto company AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. This project reviews the production data for insights that may help the manufacturing team.

### Tools/Techniques used:
R STUDIO, TIDYVERSE and DPLYR libraries from R, GGPLOT2, TTESTS.

## <u> Linear Regression to Predict MPG </u>

##### Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes

Using lm() function - all 6 columns from the MechaCar dataframe were passed to derive the p-value and r-squared value in regression model.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaCar)

![lm]( https://github.com/JoRanjit/MechaCar_Statistical_Analysis/blob/main/Images/mulitple%20lm%20against%20mpg.PNG)

1. The model shows vehicle_length p-value = 2.60e-12, ground_clearance p-value = 5.21e-08.  Hence vehicle_length and ground_clearance show significant p-value to reject the Null Hypothesis, while vehicle_weight, spoiler_angle and AWD have higher p-value, and hence they do not have a significant impact in rejecting the Null Hypothesis.
e
2. The p-value of the summary model = 5.35e-11, which is much lesser than our significance level of 0.05%.Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that:
#### The slope of our linear model is not zero.

3. Also R-squared value of 0.71 shows strong positive correlation between the variables. This means that this linear model is able to predict the mpg of MechaCar prototypes more effectively.

## Summary Statistics on Suspension Coils

##### Total Summary

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. 
We used the following R code to derive the summary statistics.

![Summarize-code]( https://github.com/JoRanjit/MechaCar_Statistical_Analysis/blob/main/Images/summarize%20code.PNG)

This is the total summary statistics that has the mean, median, variance, and standard deviation of the PSI for all manufacturing lots

![tot_summary]( https://github.com/JoRanjit/MechaCar_Statistical_Analysis/blob/main/Images/summarize.PNG)

We can clearly see that the variance is 62.29 which proves that the design specs of 100 lbs PSI is not followed.

##### Lot Summary

We also looked at the summary statistics of the 3 manufacturing lots in the factory.
![lot_summary]( https://github.com/JoRanjit/MechaCar_Statistical_Analysis/blob/main/Images/lot_summary.PNG)

Here we can see that Lot 3 with a variance of 107.29 is the skewer of the statistics.

## T-Tests on Suspension Coils

Use t-test() function to challenge the <i>'hypothesis' </i> that the PSI across all manufacturing lots is equal to the population mean of 1,500 pounds per square inch.

From the summary statistics, we can see that the mean = 1498.97 ~ 1500 PSI. We performed ttests against this mean for 
  * the whole lot - 3 lots combined, and then
  * 3 lots separately.

Here are the results:

![ttests]( https://github.com/JoRanjit/MechaCar_Statistical_Analysis/blob/main/Images/ttests.PNG)

* We can see that the p-value for the whole lot = 0.060 is greater than our significance level of 0.05%. 

* When we review ttests for each lot individually, Lot 3 has p-value = 0.04 %, while the other 2 lots have very high p-values. 
  
  <h4> Therefore, we can state that there is sufficient evidence to reject our null hypothesis for Lot 3 alone. </h4>

## Study Design: MechaCar vs Competition

Here we are conducting statistical study on how MechaCar performs against performance of vehicles from other manufacturers, ie competition. A one-way ANOVA is used to test the means of a single dependent variable across a single independent variable with multiple groups.

The different  metrics that could be tested are:
* price
* fuel efficiency
* safety-rating

<h6> Our Null Hypothesis  H0 : The means of all groups are equal, or µ1 = µ2 = … = µn. </h6>

<h6> Our Alternate Hypothesis Ha : At least one of the means is different from all other groups.</h6>

Pre-requisites for ANOVA test: 
  1. The dependent variable is numerical and continuous, and the independent variables are categorical.
  2. The dependent variable is considered to be normally distributed.
  3. The variance among each group should be very similar.

-- The Dependent variable could be the 'Price' of the vehicle. 
-- The Independent variables could be:
      * fuel efficiency(MPG)
      * AWD
      * ground clearance
      * safety ratings

A dataset containing all these metrics from different manufactures could be used for our testing.
