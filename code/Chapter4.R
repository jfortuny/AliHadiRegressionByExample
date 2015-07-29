# Chapter 4
NewYorkRiversData_p10 <- read.delim("~/R Projects/AliHadiRegressionByExample/All_Data/P010.txt")
attach(NewYorkRiversData_p10)
plot(NewYorkRiversData_p10)
plot(Nitrogen)
plot(Agr)
plot(Forest)
plot(Rsdntial)
plot(ComIndl)
# boxplots
boxplot(Agr, main = "Agr")
boxplot(Forest, main = "Forest")
boxplot(Rsdntial, main = "Rsdntial")
boxplot(ComIndl, main = "ComIndl")
boxplot(Nitrogen, main = "Nitrogen")
# ggplot2 plots - looking for outliers
library(ggplot2)
plot1 = ggplot(data=NewYorkRiversData_p10) + xlab("")
plot1 + geom_boxplot(aes(x="", y=ComIndl), 
                     outlier.colour = "red", outlier.size = 3) + 
  labs(title = "ComIndl")

# linear model
lmNY = lm(Nitrogen ~ Agr + Forest + Rsdntial + ComIndl)
summary(lmNY)
# linear model minus Neversink
# dfMinusNeversink = NewYorkRiversData_p10[- NewYorkRiversData_p10$River == "Neversink",]
dfMinusNeversink = NewYorkRiversData_p10[-4,]

lmNY2 = lm(Nitrogen ~ Agr + Forest + Rsdntial + ComIndl, data = dfMinusNeversink)
summary(lmNY2)