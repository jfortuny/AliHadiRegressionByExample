# Computer Repair Data, Chapter 2
ComputerRepairData_Table2_5_p31 <- read.delim("~/R Projects/AliHadiRegressionByExample/All_Data/P031.txt")
attach((ComputerRepairData_Table2_5_p31))
plot(Minutes,Units)
lmRepair = lm(Minutes~Units)
lmRepair
summary(lmRepair)
par(mfrow=c(2,2))
plot(lmRepair)
par(mfrow=c(1,1))
plot(Units, Minutes)
abline(lmRepair, col="red")
predict(lmRepair, interval = "prediction")
predict(lmRepair, interval = "confidence")

yHat = predict(lmRepair)
plot(yHat, Minutes)
cor(yHat, Minutes)
