# Chapter 3
SupervisorPerformanceData_p60_ch3 <- read.delim("~/R Projects/AliHadiRegressionByExample/All_Data/P060.txt")
View(SupervisorPerformanceData_p60_ch3)
attach(SupervisorPerformanceData_p60_ch3)
# The following two commands produce the same plot
plot(SupervisorPerformanceData_p60_ch3)
pairs(SupervisorPerformanceData_p60_ch3)
# linear model
lmSup = lm(Y ~ X1+X2+X3+X4+X5+X6)
lmSup
summary(lmSup)
# prediction
predict(lmSup, interval = c("confidence"))
predict(lmSup, interval = c("prediction"))
