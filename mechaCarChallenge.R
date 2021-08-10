## DELIVERABLE 1 LINEAR REGRESSION MODELLING

library(tidyverse)
# read csv file
mechaCar = read.csv("Resources/MechaCar_mpg.csv",stringsAsFactors = F)
head(mechaCar)

# summarize linear model using vehicle_length and mpg
summary(lm(mpg~vehicle_length,mechaCar))

# p-value = 2.632e-06, lesser than assumed significance level f 0.05%. Hence there is sufficient evidence to reject the null hypothesis.
#visualize a fitted line chart
model <- lm(mpg~vehicle_length,mechaCar) #create linear model
yvals <- model$coefficients["vehicle_length"]* mechaCar$vehicle_length +
  model$coefficients["(Intercept)"] #determine y-axis values from model

#plot
plt <- ggplot(mechaCar,aes(x=vehicle_length,y=mpg))
plt+geom_point() + geom_line(aes(y=yvals),color="red")

# with the chart, it looks like there is a positive correlation.
# we'll detrmine using the other factors from mechaCar - mulitple linear regression
#convert AWD int to num
mechaCar$AWD <- as.numeric(mechaCar$AWD)

# mulitple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaCar)

# summary of mulitple linear regression model to get the p-value
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechaCar))

# vehicle_length and ground_clearance show significant p-value to reject the null hypothesis
# vehicle_length p-value = 2.60e-12, ground_clearance p-value = 5.21e-08
#According to the summary output, the r-squared value has increased from 0.38 in the simple linear regression model to 0.71 in our multiple linear regression model while the p-value remained significant.


## DELIVERABLE 2 - Suspension_Coil.csv

# read.csv
susp_coil <- read.csv("Resources/Suspension_Coil.csv", stringsAsFactors = F)
head(susp_coil)

# total summary dataframe
total_summary <- susp_coil %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance=var(PSI), SD = sd(PSI) )

# lot_summary
lot_summary <- susp_coil %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI),
                  Median = median(PSI), Variance=var(PSI), SD = sd(PSI) )

## DELIVERABLE # - TTEST

#calculate the population mean
pop_mean <- mean(susp_coil$PSI)
#pop mean=1498.78 ~ 1500 for easy calculation

# dataframes for each lot
lot1_suspCoil <- filter(susp_coil,Manufacturing_Lot == "Lot1")
lot2_suspCoil <- filter(susp_coil,Manufacturing_Lot == "Lot2")
lot3_suspCoil <- filter(susp_coil,Manufacturing_Lot == "Lot3")

#ttest of the entire popultion across the oots
t.test(susp_coil$PSI,mu=1500)

#ttests for each lot's PSI against the 1500 population mean
t.test(lot1_suspCoil$PSI,mu=1500) 
t.test(lot2_suspCoil$PSI,mu=1500)  
t.test(lot3_suspCoil$PSI,mu=1500)  

