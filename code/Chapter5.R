# Chapter 5
SalarySurvey_p130 <- read.delim("~/R Projects/AliHadiRegressionByExample/All_Data/P130.txt")
View(SalarySurvey_p130)
attach(SalarySurvey_p130)

# use dplyr to implement the %>% pipeline
# use tidyR to reshape the data
library(dplyr)
library(tidyr)
library(ggplot2)

# prepare the data for plotting with ggplot2's boxplots
salNarrow = gather(SalarySurvey_p130, variable, value)
ggplot(data = salNarrow[salNarrow$variable=="S",], aes(x = variable, y = value)) + 
              geom_boxplot() + labs(title = "Salary")
ggplot(data = salNarrow[salNarrow$variable=="X",], aes(x = variable, y = value)) + 
              geom_boxplot() + labs(title = "Experience")
ggplot(data = salNarrow[salNarrow$variable=="E",], aes(x = variable, y = value)) + 
              geom_boxplot() + labs(title = "Education")
# ggplot(data = salNarrow[salNarrow$variable=="M",], aes(x = variable, y = value)) + geom_boxplot()

# Convert variables to factors
SalarySurvey_p130$M = factor(SalarySurvey_p130$M, labels = c("Employee", "Manager"))
SalarySurvey_p130$E = factor(SalarySurvey_p130$E, labels = c("HS", "BS", "Adv"))

# Fit a linear model
lmSup = lm(S ~ X + E + M)
lmSup
summary(lmSup)
