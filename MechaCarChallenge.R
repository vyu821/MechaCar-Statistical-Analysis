library(dplyr)

# Deliverable 1

# import MechaCar_mpg.csv file
mecha = read.csv(file='MechaCar_mpg.csv')

# perform linear regression
lm(mpg~.,data=mecha)
summary(lm(mpg~.,data=mecha))


# Deliverable 2

# import Suspension_Coil.csv file
sus = read.csv(file='Suspension_Coil.csv')

# create total_summary df using summarize() to get mean, median, variance,and sd of PSI column
total_summary <- sus %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# create lot_summary to group each manufacturing lot by same statistics as above
lot_summary <- sus %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI))
