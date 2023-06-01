#get variable description
MORTGAGE30US<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/MORTGAGE30US.csv")
head(MORTGAGE30US)
str(MORTGAGE30US)
MORTGAGE30US$DATE<-as.Date(MORTGAGE30US$DATE)
str(MORTGAGE30US)

FEDFUNDS<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/FEDFUNDS.csv")
head(FEDFUNDS)
str(FEDFUNDS)
FEDFUNDS$DATE<-as.Date(FEDFUNDS$DATE)
str(FEDFUNDS)

CPILFESL<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/CPILFESL.csv")
head(CPILFESL)
str(CPILFESL)
CPILFESL$DATE<-as.Date(CPILFESL$DATE)
str(CPILFESL)

NGDPNSAXDCUSQ<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/NGDPNSAXDCUSQ.csv")
head(NGDPNSAXDCUSQ)
str(NGDPNSAXDCUSQ)
NGDPNSAXDCUSQ$DATE<-as.Date(NGDPNSAXDCUSQ$DATE)
str(NGDPNSAXDCUSQ)

TB3MS<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/TB3MS.csv")
head(TB3MS)
str(TB3MS)
TB3MS$DATE<-as.Date(TB3MS$DATE)
str(TB3MS)

GS20<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/GS20.csv")
head(GS20)
str(GS20)
GS20$DATE<-as.Date(GS20$DATE)
str(GS20)

USSTHPI<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/USSTHPI.csv")
head(USSTHPI)
str(USSTHPI)
USSTHPI$DATE<-as.Date(USSTHPI$DATE)
str(USSTHPI)

HQMCB10YR<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/HQMCB10YR.csv")
head(HQMCB10YR)
str(HQMCB10YR)
HQMCB10YR$DATE<-as.Date(HQMCB10YR$DATE)
str(HQMCB10YR)

LREM64TTUSM156S<-read.csv("/Users/candicewu/Desktop/ECON400/projects/project 2/datasets/LREM64TTUSM156S.csv")
head(LREM64TTUSM156S)
str(LREM64TTUSM156S)
LREM64TTUSM156S$DATE<-as.Date(LREM64TTUSM156S$DATE)
str(LREM64TTUSM156S)

#https://stackoverflow.com/questions/66193187/how-to-break-quarterly-data-into-monthly-using-certain-formula-in-r
#load the libraries
library(zoo)
#break quarterly data into monthly for NGDPNSAXDCUSQ
z <- read.zoo(NGDPNSAXDCUSQ, FUN = function(x) as.yearqtr(x, "%Y-Q%q"))
NGDPNSAXDCUSQ <- zooreg(na.approx(c(t(cbind(z, NA, NA)))), 
                start = as.yearmon(start(z)), freq = 12)
NGDPNSAXDCUSQ <- fortify.zoo(NGDPNSAXDCUSQ) 
head(NGDPNSAXDCUSQ)

#break quarterly data into monthly for USSTHPI
z <- read.zoo(USSTHPI, FUN = function(x) as.yearqtr(x, "%Y-Q%q"))
USSTHPI <- zooreg(na.approx(c(t(cbind(z, NA, NA)))), 
                start = as.yearmon(start(z)), freq = 12)
USSTHPI<- fortify.zoo(USSTHPI) 
head(USSTHPI)

# Merging quarterly datasets based on DATE column
quarterly_df <- merge(NGDPNSAXDCUSQ, USSTHPI, by = "Index")
head(quarterly_df)
str(quarterly_df)
# Convert the date string to Date format
quarterly_df$Index <- as.Date(quarterly_df$Index, format = "%b %Y")
#change the column name
colnames(quarterly_df)[colnames(quarterly_df) == "Index"] <- "DATE"
head(quarterly_df)

library(dplyr)
# Left join
merged_df <- left_join(MORTGAGE30US, FEDFUNDS, by = "DATE")
merged_df <- left_join(merged_df, CPILFESL, by = "DATE")
merged_df <- left_join(merged_df, TB3MS, by = "DATE")
merged_df <- left_join(merged_df, GS20, by = "DATE")
merged_df <- left_join(merged_df, HQMCB10YR, by = "DATE")
merged_df <- left_join(merged_df, LREM64TTUSM156S, by = "DATE")
merged_df <- left_join(merged_df, quarterly_df, by = "DATE")
head(merged_df)

#remove missing values
df<-na.omit(merged_df)
#remove duplicates
df<-unique(df)
# Check for missing values using is.na()
is.na(df)
#check duplicates
duplicates<- duplicated(df)
duplicates
#check
head(df)
tail(df)
dim(df)

# Save the data frame as a CSV file
write.csv(df, file = "/Users/candicewu/Desktop/mortgage data.csv", row.names = FALSE)
