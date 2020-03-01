getwd()
rm(list=ls())

###### 패키지 로드

# 사용하고자 하는 패키지를 벡터로 저장
pkg = c("tidyverse", "skimr", "GGally", "plotly", "viridis", "caret", "randomForest", "e1071",
        "rpart", "xgboost", "h2o", "corrplot", "knitr", "rattle",
        "rpart.plot", "corrgram", "visNetwork","sparkline",
        "mlbench", "data.table", "dplyr","parallelSVM", "patchwork")


# 기존에 설치 되어있는 패키지를 제외하고 설치하고 알아서 로드한다. 
ipak <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, require, character.only = TRUE)
}

# 함수호출
ipak(pkg)








###### 데이터 로드

train = read_csv("./01original-data/train.csv")
test  = read_csv("./01original-data/test.csv")
sub   = read_csv("./01original-data/sample_submission.csv")


summary(train)
str(train)
colSums(is.na(train))



  
  