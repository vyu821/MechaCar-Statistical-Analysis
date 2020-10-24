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


# Deliverable 3

# t test to determine if the PSI across all lots is statistically different from pop mean
# sample of the population
sample_sus <- sus %>% sample_n(50)
t.test(sample_sus$PSI, mu=total_summary$Mean)
# p-value of .55 > .05 therefore fail to reject null hyp, two means are statistically similar

# t test to determine if the PSI for each 3 manufacturing lot is statistically different from pop mean
lot1 = sus %>% filter(Manufacturing_Lot == 'Lot1')
sample1 = lot1 %>% sample_n(25)
t.test(sample1$PSI, mu=total_summary$Mean)

lot2 = sus %>% filter(Manufacturing_Lot == 'Lot2')
sample2 = lot2 %>% sample_n(25)
t.test(sample2$PSI, mu=total_summary$Mean)

lot3 = sus %>% filter(Manufacturing_Lot == 'Lot3')
sample3 = lot3 %>% sample_n(25)
t.test(sample3$PSI, mu=total_summary$Mean)
       