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
summary(l)
# prediction
predict(lmSup, interval = c("confidence"))
predict(lmSup, interval = c("prediction"))
# plot it
par(mfrow=c(2,2))
plot(lmSup)
par(mfrow=c(1,1))
yHat = predict(lmSup)
plot(yHat, Y)
cor(yHat, Y)

# Reduced model
lmSupRM = lm(Y ~ X1+X3)
lmSupRM
summary(lmSupRM)
# anova will provide SS and F-test values for the predictors
anova(lmSupRM)
# to get the anova for the full model
anova(update(lmSupRM, ~ 1), lmSup)
# and for the reduced model
anova(update(lmSupRM, ~ 1), lmSupRM)

