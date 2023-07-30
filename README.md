# Statistical Analysis of Economic Variables and the Mortgage Rate in the United States
ECON 400: Econometrics- Bellevue College</p>
Project Paper</p>
By Candice Wu</p>

## I. INTRODUCTION
The purpose of this statistical analysis is to examine the relationship between various
economic variables and the 30-Year Fixed Rate Mortgage Average in the United States
(MORTGAGE30US). In this analysis, I aim to investigate the impact of these
independent variables on the mortgage rate and determine which variables have a
significant relationship with MORTGAGE30US. Additionally, I will address challenges
such as multicollinearity and skewness in the dataset, performing appropriate
techniques to mitigate their effects. The findings of this analysis will contribute to a
better understanding of the factors influencing mortgage rates in the United States

## II. DATA
### A. About The Dataset
The dataset used in this analysis is extracted from the Federal Reserve's Economic
Data (FRED) database, covering the period from October 1, 1993, to October 31, 2022.
The dataset comprises 349 observations and includes 9 variables. The dependent
variable is MORTGAGE30US and the independent variables are FEDFUNDS,
CPILFESL, NGDPNSAXDCUSQ, TB3MS, GS20, USSTHPI, HQMCB10YR, and LREM64TTUSM156S.
### B. Variables
MORTGAGE30US: 30-Year Fixed Rate Mortgage Average in the United States</p>
FEDFUNDS: Federal Funds Effective Rate</p>
CPILFESL: Consumer Price Index for All Urban Consumers: All Items Less Food and
Energy in U.S. City Average</p>
NGDPNSAXDCUSQ: Nominal Gross Domestic Product for United States</p>
TB3MS: 3-Month Treasury Bill Secondary Market Rate, Discount Basis</p>
GS20: Market Yield on U.S. Treasury Securities at 20-Year Constant Maturity, Quoted
on an Investment Basis</p>
USSTHPI: All-Transactions House Price Index for the United States</p>
HQMCB10YR: 10-Year High Quality Market (HQM) Corporate Bond Spot Rate</p>
LREM64TTUSM156S: Employment Rate: Aged 15-64: All Persons for the United States</p>
### C. Data Visualization
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/4e5c93a2-7120-40b9-8527-2a945eae5d83)</p>
When analyzing a dataset for statistical purposes, it is vital to examine the correlation
matrix of variables as it provides valuable insights into the strength, direction, and
significance of relationships between variables. The correlation coefficient ranges from
-1 to 1, where values close to 1 indicate a strong positive correlation, values close to -1
indicate a strong negative correlation, and values close to 0 indicate little to no
correlation.</p>
Based on the plot of the correlation matrix provided above, there are many pairs of
variables that are highly correlated with each other. It also indicates the presence of
multicollinearity in the dataset.
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/a107ce79-cddd-4e6d-b83f-d056f3e835f3)
Furthermore, it is essential to assess the distribution of each variable to ensure the
fulfillment of assumptions required by many statistical functions, particularly the
assumption of normality or near-normality. Additionally, skewness is a measure of the
asymmetry of a random variable's distribution around its mean and can help identify
deviations from a symmetrical distribution. If the histogram has a long tail on the right
side and the majority of the data is concentrated on the left side, it suggests a
right-skewed distribution. Moreover, if the histogram has a long tail on the left side and
the majority of the data is concentrated on the right side, it suggests a left-skewed
distribution.</p>
In this dataset, variables such as FEDFUNDS, TB3MS, and USSTHPI demonstrate
right-skewed distributions, while LREM64TTUSM156S displays a left-skewed
distribution
## III. METHODS and MODEL
### A. Applying Transformation
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/f385482b-8bde-4015-b18e-b9bd2ae6c327)</p>
Given that both USSTHPI and LREM64TTUSM156S exhibit absolute skewness values
between 0.5 and 1, indicating moderate skewness, it is appropriate to apply the square
root transformation method. This method can help achieve a more symmetrical
distribution and meet the assumptions.
### B. Handling Multicollinearity Issue
To address the presence of multicollinearity in the dataset, one approach is to check the
Variance Inflation Factor (VIF) and drop variables with high VIF values. “As an arbitrary
rule of thumb, it is often suggested that the VIF should not exceed 10.” (Dr. Lawrence,
wk3)</p>
By dropping variables with high VIF values one at a time, the final set of independent
variables in the model are as follows:</p>
FEDFUNDS with VIF of 4.558909</p>
USSTHPI with VIF of 2.255771</p>
HQMCB10YR with VIF of 3.373104</p>
LREM64TTUSM156S with VIF of 3.548210</p>
### C. Model
Three models will be conducted for analysis. The first model is an Ordinary Least
Squares (OLS) model with the dependent variable (MORTGAGE30US) and
independent variables including FEDFUNDS, CPILFESL, NGDPNSAXDCUSQ, TB3MS,
GS20, USSTHPI, HQMCB10YR, and LREM64TTUSM156S. The second model is also
an OLS model with the dependent variable and independent variables consisting of
FEDFUNDS, USSTHPI, sqrt_HQMCB10YR, and sqrt_LREM64TTUSM156S. In this
model, the independent variables sqrt_HQMCB10YR and sqrt_LREM64TTUSM156S
are the square root transformations of HQMCB10YR and LREM64TTUSM156S. The
last model will utilize Weighted Least Squares (WLS) regression. It will have the
dependent variable and independent variables, including FEDFUNDS, USSTHPI,
sqrt_HQMCB10YR, and sqrt_LREM64TTUSM156S.
## IV. RESULTS and INTERPRETATION
### A. Full model
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/d4075aab-ad78-4348-9816-beec9ae3bc7c)
The coefficients for FEDFUNDS, TB3MS, GS20, USSTHPI, HQMCB10YR, and
LREM64TTUSM156S are statistically significant (p < 0.05), indicating a significant
relationship between these variables and the MORTGAGE30US. This suggests that
changes in these variables are associated with changes in the mortgage rate.</p>
The F-statistic is 3281 with a p-value of < 2.2e-16, indicating that the overall model is
highly statistically significant. This means that the independent variables, as a group,
have a significant impact on predicting the mortgage rate.</p>
However, in situations where variables demonstrate high correlation, it can be
challenging to determine the individual effects of each variable on the dependent
variable. Moreover, the presence of skewness in the data has the potential to violate the
assumptions of linear regression and affects the accuracy of the results.
### B. Best Model
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/cb87d254-e670-4aac-9b2f-d9f1fd5a6bb8)
The coefficients for FEDFUNDS, HQMCB10YR, sqrt_USSTHPI, and
sqrt_LREM64TTUSM156S are statistically significant (p < 0.05), indicating a significant
relationship between these variables and the MORTGAGE30US. This suggests that
these variables have a meaningful impact on the mortgage rate.</p>
The F-statistic is 2214 with a p-value of < 2.2e-16, indicating that the overall model is
highly statistically significant. This means that the independent variables, have a
significant impact on predicting the mortgage rate.</p>
The R-squared value of 0.9626 indicates that approximately 96.26% of the variance in
the mortgage rate can be explained by the independent variables in the model. This
implies that the model provides a strong fit to the data.
#### 1. the residuals against each of the x-variables
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/b9f8945e-0eaf-4c88-a1dd-733bc8a695f1)
Based on the residual plots, the points appear to be randomly scattered around the
residual = 0 line. This indicates that the assumptions of linearity and constant variance
are reasonably met, suggesting that a linear model is appropriate for modeling this data.
#### 2. White’s Test
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/a10ae48a-bde6-44d7-a86f-c7177b54d874)
Based on the p-value being less than 0.05, we reject the null hypothesis. Therefore, we
have sufficient evidence to conclude that heteroscedasticity is present in the regression
model. This implies that the assumption of equal variance of the error terms is violated.</p>
In the presence of heteroscedasticity, the OLS estimator may still be unbiased, but the
usual F-test and t-tests may not be valid. Therefore, caution should be exercised when
interpreting the significance of individual coefficients. It may be necessary to employ
alternative statistical techniques or robust standard errors to account for the
heteroscedasticity and obtain valid inferences from the model.
#### 3. Robust Standard Errors
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/dcc7b123-f167-495a-a5e3-901be4596ee2)
By using robust standard errors, which are designed to handle heteroscedasticity, all the
coefficients in the model are statistically significant in explaining the variation in the
dependent variable. This indicates that these variables have a meaningful impact on the
outcome variable, even when accounting for heteroscedasticity.
### C. WLS Model
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/825fd526-118e-4071-9553-7a8fb92b3d07)
All variables in the model have p-values less than 0.05, indicating their statistical
significance in explaining the variation in the mortgage rate. The F-statistic of 2235
and a p-value of < 2.2e-16 indicate the overall high statistical significance of the
model.</p>
The R-squared value of 0.9629 indicates that approximately 96.29% of the variance in
the MORTGAGE30US can be explained by the independent variables. The adjusted
R-squared value of 0.9625 takes into account the number of predictors in the model,
providing a more conservative estimate of the proportion of variance explained.
## V. CONCLUSION
In conclusion, this statistical analysis examined the relationship between various
economic variables and the 30-Year Fixed Rate Mortgage Average in the United States.
Through the evaluation of three different models, I identified key variables that have a
significant impact on the mortgage rate.</p>
The results of the best model revealed that the FEDFUNDS, HQMCB10YR,
sqrt_USSTHPI, and sqrt_LREM64TTUSM156S were statistically significant predictors of
MORTGAGE30US. These findings suggest that changes in these variables are
associated with changes in the mortgage rate.</p>
Moreover, the models demonstrated a high overall statistical significance, indicating that
the independent variables collectively have a strong impact on predicting the mortgage
rate. The high R-squared values of the models indicate a good fit to the data, with
approximately 96% of the variance in the MORTGAGE30US explained by the
independent variables.</p>
These findings provide valuable insights into the factors influencing the mortgage rate
and can assist in making informed decisions in the real estate and financial sectors.
However, it is important to acknowledge the limitations of the models, such as the
presence of heteroscedasticity and the need for further robustness checks. Further
research and analysis are recommended to validate and enhance the findings
presented in this study.
## References:
"Economic Theory Blog." Robust Standard Errors. Economic Theory Blog, 7 Aug. 2016,
https://economictheoryblog.com/2016/08/07/robust-standard-errors/#:~:text=%E2%80%
9CRobust%E2%80%9D%20standard%20errors%20is%20a,linear%20unbiased%20esti
mator%20(BLUE).</p>
"How to Interpret a Residual Plot - Explanation." Study.com, Study.com, n.d. Accessed 26
May 2023.</p>
https://study.com/skill/learn/how-to-interpret-a-residual-plot-explanation.html.
FRED (Federal Reserve Economic Data)." Federal Reserve Bank of St. Louis,
fred.stlouisfed.org/</p>
"Weighted Least Squares in R - Statology." Statology, 2023,
www.statology.org/weighted-least-squares-in-r/</p>
"Skewness and Kurtosis in R - Statology." Statology, 2023,
www.statology.org/skewness-kurtosis-in-r/</p>
Wk3-Collinearity</p>
WK6-Hsk</p>
## Stargazer:
![image](https://github.com/WuCandice/-Statistical-Analysis-of-Economic-Variables-and-the-Mortgage-Rate-in-the-United-States/assets/127648422/b1021742-cfb6-446c-84dc-a6de7247dbec)


