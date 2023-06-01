df<-read.csv("/Users/candicewu/Desktop/mortgage data.csv")
#load the libraries
library(zoo)
library(ggplot2)
library(kableExtra)
library(dplyr)
library(caTools)
library(psych)
library(corrplot)
library(car)
library(stats)
library(moments)

#get general observation about the dataset
dim(df)
head(df)
tail(df)
summary(df)
names(df)

#remove unnecessary columns
df<-df[,-1]
head(df)

#create matrix plot
par(mfrow = c(1, 1))
df.matrix <- cor(df)
corrplot(df.matrix, method = "number")

# Create a new plot window with multiple histogram
par(mfrow = c(3, 3))
hist(df$MORTGAGE30US)
hist(df$FEDFUNDS)
hist(df$CPILFESL)
hist(df$TB3MS)
hist(df$GS20)
hist(df$HQMCB10YR)
hist(df$LREM64TTUSM156S)
hist(df$NGDPNSAXDCUSQ)
hist(df$USSTHPI)

#find the skewness
#https://www.statology.org/skewness-kurtosis-in-r/
skewness(df)
#since USSTHPI and LREM64TTUSM156S are moderately skewed, we are going to apply square_root
transformed_df <- data.frame(df, sqrt_USSTHPI = sqrt(df$USSTHPI))
transformed_df$sqrt_LREM64TTUSM156S <- sqrt(df$LREM64TTUSM156S)
head(transformed_df)

#compare the result for the variables that are transformed and without transformed
par(mfrow = c(1, 2))
boxplot(transformed_df$USSTHPI, main = "USSTHPI Boxplot", xlab = "USSTHPI Variable")
boxplot(transformed_df$sqrt_USSTHPI, main = "sqrt_USSTHPI Boxplot", xlab = "sqrt_USSTHPI Variable")
boxplot(transformed_df$LREM64TTUSM156S, main = "LREM64TTUSM156S Boxplot", xlab = "LREM64TTUSM156S Variable")
boxplot(transformed_df$sqrt_LREM64TTUSM156S, main = "sqrt_LREM64TTUSM156S Boxplot", xlab = "sqrt_LREM64TTUSM156SVariable")

#Estimate OLS with all the variables before applied transformation(full model)
model1<-lm(MORTGAGE30US~ ., data=df)
summary(model1)

#Estimate OLS with all the variables 
model2<-lm(MORTGAGE30US~ ., data=transformed_df)
summary(model2)

#check multicollinearity
vif(model1)
vif(model2)
#as an arbitrary rule of thumb, the VIF should not be larger than 10

#drop insignificant variables with high VIF values one at a time
transformed_df <- subset(transformed_df, select=-c(CPILFESL,TB3MS,GS20,LREM64TTUSM156S,NGDPNSAXDCUSQ,USSTHPI))
head(transformed_df)

#best model
model3<-lm(MORTGAGE30US~ ., data=transformed_df)
summary(model3)
vif(model3)

# Analyze residuals against each of the x-variables using scatterplot
par(mfrow = c(2, 2))
residuals <- residuals(model3)
#https://www.statology.org/residual-plot-r/
plot(transformed_df$FEDFUNDS, residuals, xlab = "FEDFUNDS", ylab = "Residuals", main = "Residual Plot for FEDFUNDS")
#add a horizontal line at 0 
abline(0,0, col='blue')
plot(transformed_df$sqrt_USSTHPI, residuals, xlab = "sqrt_USSTHPI", ylab = "Residuals", main = "Residual Plot for sqrt_USSTHPI")
abline(0,0, col='blue')
plot(transformed_df$HQMCB10YR, residuals, xlab = "HQMCB10YR", ylab = "Residuals", main = "Residual Plot for HQMCB10YR")
abline(0,0, col='blue')
plot(transformed_df$sqrt_LREM64TTUSM156S, residuals, xlab = "sqrt_LREM64TTUSM156S", ylab = "Residuals", main = "Residual Plot for sqrt_LREM64TTUSM156S")
abline(0,0, col='blue')


#https://www.statology.org/weighted-least-squares-in-r/
#load lmtest package
library(lmtest)
#perform white's test
bptest(model3, ~fitted(model3)+I(fitted(model3)^2))
#HO: Homoscedasticity is present
#HA: Heteroscedasticity is present
#Since the p-value is less than 0.05, we reject the null hypothesis.
#We can conclude that there is sufficient evidence to say that heteroscedasticity is present in the regression model.

#https://www.statology.org/robust-standard-errors-in-r/
library(lmtest)
library(sandwich)
#calculate robust standard errors for model coefficients
coeftest(model3, vcov = vcovHC(model3, type = 'HC0'))
#Since heteroscedasticity is present in the original regression model, 
#this estimate for the standard error is more trustworthy

#perform weighted least squares regression
#define weights to use
wt <- 1 / lm(abs(model3$residuals) ~ model3$fitted.values)$fitted.values^2
#perform weighted least squares regression
wls_model <- lm(MORTGAGE30US~., data = transformed_df, weights=wt)
#view summary of model
summary(wls_model)

# regression table
library(stargazer)
stargazer(model1,model3,wls_model,  type = "text") 


        