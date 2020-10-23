library(dplyr)

# import csv file
mecha = read.csv(file='MechaCar_mpg.csv')

# perform linear regression
lm(mpg~.,data=mecha)
summary(lm(mpg~.,data=mecha))

