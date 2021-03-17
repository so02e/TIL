# 다중 회귀분석 : 정수기 대수를 기준으로 추후 소요될 AS 시간을 예측하고, AS 기사를 몇명 고용할지 산출 (기사 한명이 한달간 처리하는 AS 시간은 8시간 * 20 일)

# purifier : 전월 정수기 총 대여수
# old_ purifier : 전월 10년 이상 노후 정수기 총 대여 수
# as_time : 당월 AS 소요 시간

Purifier <- read.csv('data/Purifier.csv' ,header = TRUE,encoding = "UTF-8")
library(dplyr)
Purifier <- Purifier %>% mutate(new_purifier=purifier-old_purifier)
cor(Purifier)

Purifier.lm <- lm(as_time ~ .-purifier, data=Purifier)
summary(Purifier.lm)
 
193.73664 + (0.23977 * 70000 ) + (0.08881  * (300000-70000))
# 37403.94 시간이 소요
(193.73664 + (0.23977 * 70000 ) + (0.08881  * (300000-70000)) ) / (8*20)
# 234명의 기사가 필요하다. 

# predict 함수로 예측 가능. 