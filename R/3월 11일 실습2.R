library(dplyr)

# 1. ggplot2 패키지에서 제공되는 mpg 라는 데이터 셋의 구조를 확인한다.
library(ggplot2)
mpg

## 1-1 mpg의 구조를 확인한다.
str(mpg)
## 1-2 mpg 의 행의 개수와 열의 개수를 출력한다.
nrow(mpg)
ncol(mpg)
## 1-3 mpg의 데이터를 앞에서 10개 출력한다.
head(mpg,10)
## 1-4 mpg의 데이터를 뒤에서 10개 출력한다.
tail(mpg,10)
## 1-5. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)
## 1-6 mpg를 열 단위로 요약한다.
summary(mpg)
## 1-7 mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer) %>% summarise(count=n())
## 1-8 mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg %>% group_by(manufacturer,model) %>% summarise(count=n())





# 2.
## 2-1
new_mpg <- rename(mpg,city=cty,highway=hwy)

## 2-2
head(new_mpg)




# 3. midwest 데이터를 사용해 데이터 분석 문제를 해결해보세요.
midwest

## 3-1 ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
str(midwest)
View(midwest)
## 3-2 poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.
new_midwest <- rename(midwest,total=poptotal,asian=popasian)
new_midwest
## 3-3 total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들어 보세요
new_midwest <- new_midwest %>% mutate(perasian = (asian/total)*100) 
new_midwest
View(new_midwest)

## 3-4 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.
#(meanasian <- as.new_midwest %>% summarise(mean(perasian)))

meanasian <- mean(new_midwest$perasian)

result <- new_midwest %>% mutate(comasian = ifelse(perasian > meanasian, "large","small"))
View(result)




# 4.
## 4-1
new_mpg2 <- mpg %>% mutate(vs_displ = ifelse(displ<=4,"small","large"))
new_mpg2 %>% group_by(vs_displ) %>% summarise(mean(hwy))
# small 의 연비가 더 높다.

## 4-2
new_mpg3 <- mpg %>% filter(manufacturer==c("audi","toyota")) %>% group_by(manufacturer) %>% summarise(mean(cty))
new_mpg3
# toyota의 연비가 더 높다.

## 4-3
new_mpg4 <- mpg %>% filter(manufacturer==c("chevrolet","ford","honda")) %>% group_by(manufacturer) %>% summarise(mean(hwy))
new_mpg4





# 5.
## 5-1
mpg5 <- mpg %>% select(class,cty)
head(mpg5)

## 5-2
mpg5 %>% group_by(class) %>% summarise(mean(cty))
# compact이 더 크다.




# 6
mpg %>% filter(manufacturer=="audi") %>% arrange(desc(hwy)) %>% head(5)
