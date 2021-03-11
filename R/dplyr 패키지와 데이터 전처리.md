# 1. R과 dplyr 패키지를 이용한 데이터 전처리

## 1) dplyr 패키지

==데이터프레임==에 담겨진 **데이터들의 전처리**에 가장 많이 사용되는 패키지이다. dplyr은 plyr의 차기작으로서, 유연한 데이터 조작의 문법을 제공하며 데이터프레임을 집중적으로 다루는 툴이다. 데이터 조작을 위한 문법으로 체계화를 해서 한번 배워놓으면 쉽다는 점과 더불어, C언어로 만들어서 매우 빠르다.

```R
install.packages("dplyr") library(dplyr)
```



> :spiral_notepad: **<u>데이터 전처리</u> :spiral_notepad:**
>
> > 주어진 원데이터를 그대로 사용하기보다는 원하는 형태로 변형해서 분석하는 경우가 굉장히 많다. **분석에 적합하게 데이터를 가공하는 작업**을 `데이터 전처리`라고 한다. 데이터의 이상치나 결측치에 대한 처리도 이 단계에서 처리한다<br/><br/>유사어 : 데이터 가공(Data Manipulation), 데이터 핸들링(Data Handling), 데이터 클리닝(Data Cleanging)



![image-20210311084204874](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210311084204874.png)

![image-20210311084210662](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210311084210662.png)



## (2) dplyr 패키지의 함수

### ① 조건에 맞는 데이터 추출

#### ⓐ filter()

filter(dataframe, filter condition 1, filter condition 2, ...)
&(AND) 조건으로 row 데이터 부분집합 선별

함수 `filter()`는 조건에 따라 행(row)을 추출합니다. 사용방법은 첫 번째 인수로 추출 대상이 되는 데이터 프레임을 지정하고, 두 번째 인수로 추출하고 싶은 행의 조건을 지정합니다. 이 서술방법은 dplyr 패키지의 다른 기본함수에도 똑같이 적용됩니다. AND 조건문 콤마(`,`)로 구별하거나 `&` 연산자를 사용해도 되며 OR 조건문은 `|` 연산자를 이용합니다.

````R
library(MASS)
table(Cars93$Type)
filter(Cars93, Type == c("Compact"), Max.Price <= 20, MPG.highway >= 30)
filter(dataframe, filter condition 1 | filter condition 2 | ...)
filter(Cars93, Type == c("Compact") | Max.Price <= 20 | MPG.highway >= 30)
````



#### ⓑ slice()

slice(dataframe, from, to) : 위치를 지정해서 row 데이터 부분집합 선별하기
filter()가 조건에 의한 선별이었다면, **위치(position)**를 사용해서 부분집합 선별은 slice() 함수를 사용한다.

```R
slice(Cars93, 6:10)
```



### ② 정렬

#### ⓐ arrange()

데이터 프레임 행 정렬하기 (arrange rows of data frame) : arrange() arrange(dataframe, order criterion 1, order criterion 2, ...) 여러개의 기준에 의해서 정렬을 하고 싶으면 기준 변수를 순서대로 나열핚다. 기본 정렬 옵션은 오름차순(ascending)이며, 만약 내림차순(descending) 으로 정렬을 하고 싶다면 desc()를 입력한다.

```R
arrange(Cars93, desc(MPG.highway), Max.Price)
```



### ③ 열의 추출

#### ⓐ select()

select(dataframe, VAR1, VAR2, ...) : 선별하고자 하는 변수 이름을 기입

```R
select(Cars93, Manufacturer, Max.Price, MPG.highway) select(Cars93, Manufacturer:Price) select(Cars93, 1:5) select(Cars93, -(Manufacturer:Price))
select(dataframe, starts_with("xx_name")) : "xx_name"으로 시작하는 모든 변수 선별
select(Cars93, starts_with("MPG"))
select(dataframe, ends_with("xx_name")) : "xx_name"으로 끝나는 모든 변수 선별
select(Cars93, ends_with("Price"))
select(dataframe, contains("xx_name")) : "xx_name"을 포함하는 모든 변수 선별
select(Cars93, contains("P"))
select(dataframe, matches(".xx_string.")) : 정규 표현과 일치하는 문자열이 포함된 모든 변수 선별
head(select(Cars93, matches(".P.")))
head(select(Cars93, matches("P")))
select(dataframe, one_of(vars)) : 변수 이름 그룹에 포함된 모든 변수 선별
vars <- c("Manufacturer", "MAX.Price", "MPG.highway")
head(select(Cars93, one_of(vars)))
select(dataframe, num_range("V", a:n)) : 접두사와 숫자 범위를 조합해서 변수 선별
V1 <- c(rep(1, 10)); V2 <- c(rep(1:2, 5)); V3 <- c(rep(1:5, 2)); V4 <- c(rep(1:10))
df <- data.frame(V1, V2, V3, V4)
select(df, num_range("V", 2:3))
```





### ④ 데이터 프레임 변수 이름 변경

#### ⓐ rename()

dpylr 패키지의 rename() 함수는 rename(dataframe, new_var1 = old_var1, new_var2 = old_var2, ...) 의 형식으로 사용한다.

```
names(Cars93) Cars93_1 <- rename(Cars93, 제조사=Manufacturer, 모델=Model)
```



### ⑤ 중복이 없는 유일한 값 추출

#### ⓐ distinct()

distinct(dataframe, 기준 var1, 기준 var2, ...) 의 형식으로 중복없는 유일한(distinct, unique) 값을 추출하고자 하는 기준 변수를 기입해주면 된다.

```
names(Cars93) 
distinct(Cars93, Origin)
distinct(Cars93, Type)
distinct(Cars93, Origin, Type)
```



### ⑥ 표본 데이터 추출

#### ⓐ sample_n()

무작위 표본 데이터 추출 : sample_n(), sample_frac()
sample_n(dataframe, a fixed number) : 특정 개수만큼 무작위 추출



```
sample_n(Cars93[, 1:5], 10)
sample_n(Cars93[, 1:5], 10)
```



#### ⓑ sample_frac()

sample_frac(dataframe, a fixed fraction) : 특정 비율만큼 무작위 추출

```
nrow(Cars93)
nrow(Cars93)*0.1
sample_frac(Cars93[ , 1:5], 0.1)
```



#### ⓒ sample_n()

sample_n(dataframe, n, replace = TRUE) : 복원 추출

```
sample_n(Cars93[, 1:5], 20, replace = TRUE) # a bootstrap sample of 20 records
```



### ⑦ 각 조작의 연결

#### ⓐ chain()

chain() 함수 - %>% (단축키 shift+ctrl+M)
함수 chain() 혹은 간단히 %>%를 이용함으로써 각 조작을 연결해서 한 번에 수행할 수 있다. %>%로 연결하면 가장 먼저 데이터 프레임을 지정하면 그 다음부터는 인수를 생략할 수 있을 뿐 아니라 앞선 함수의 결과(데이터 프레임)를 뒤에 오는 함수의 입력 값으로 사용하게 된다. 



"Cars93 데이터프레임에서 차생산국가(Origin), 차종(Type), 실린더개수(Cylinders)별로 차가격(Price)과 고속도로연비(MPG.highway)의 평균을 구하되, 차가격 평균 10 초과 & 고속도로연비 25 초과하는 경우만 선별해서 제시하시오"



```R
a1 <- group_by(Cars93, Origin, Type, Cylinders)
a2 <- select(a1, Price, MPG.highway)
a3 <- summarise(a2,
Price_m = mean(Price, na.rm = TRUE),
MPG.highway_m =
mean(MPG.highway, na.rm = TRUE))
a4 <- filter(a3, Price_m > 10 | MPG.highway_m > 25)
```





```R
filter(
summarise(
select(
group_by(Cars93, Origin, Type, Cylinders),
Price, MPG.highway
),
Price_m = mean(Price, na.rm = TRUE),
MPG.highway_m = mean(MPG.highway, na.rm = TRUE)
),
Price_m > 10 | MPG.highway_m > 25
)
```





(a)Cars93 데이터프레임에서 %>% (b) 제조생산국(Origin), 차종(Type), 실린더개수(Cylinders)별로 %>% (c) 차 가격(Price)과 고속도로 연비(MPG.highway) 변수에 대해 %>% (d) (결측값은 제외하고) 평균을 구하는데, %>% (e) 단, 가격 평균은 10을 넘고 & 고속도로 연비는 25를 넘는 것만 알고 싶다“

```R
Cars93 %>%
group_by(Origin, Type, Cylinders) %>%
select(Price, MPG.highway) %>%
summarise(
Price_m = mean(Price, na.rm = TRUE),
MPG.highway_m = mean(MPG.highway, na.rm = TRUE)) %>%
filter(Price_m > 10 | MPG.highway_m > 25)
```





```R
Cars93 %>% select(Manufacturer, Max.Price, MPG.highway) %>% 
head() 
Cars93 %>% filter(Type == c("Compact") | Max.Price <= 20 | MPG.highway >= 30) %>% select(Manufacturer, Model, Price) %>% 
tail() 
Cars93 %>% filter(Manufacturer == 'Honda') %>% select(Manufacturer, Model, Price) %>% arrange
```





### ⑧ 집계

#### ⓐ group_by() : 그룹별 집계

Cars93 %>%

```
Cars93 %>% group_by(Manufacturer) %>% summarise(mean_price = mean(Price))
Cars93 %>% group_by(Manufacturer) %>%
summarise(mean_price = mean(Price), max_price = max(Price), min_price = mean(Price))
Cars93 %>% group_by(Manufacturer, Model) %>%
summarise(mean_price = mean(Price), max_price = max(Price), min_price = mean(Price))
```



#### ⓑ summarise()

```
Cars93 %>% group_by(Type) %>% summarise(count = n())
```



:spiral_notepad: **<u>자주 사용하는 요약 통계량 함수</u> :spiral_notepad:**

|   함수   |   의미   |
| :------: | :------: |
|  mean()  |   평균   |
|   sd()   | 표준편차 |
|  sum()   |   합계   |
| median() |  중앙값  |
|   sd()   | 표준편차 |
|  min()   |  최솟값  |
|  max()   |  최댓값  |
|   n()    |   빈도   |





![](https://statkclee.github.io/r-novice-gapminder/fig/13-dplyr-fig1.png)



![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpQUwre7EUeHQo5FUyjjJcogrKjEtFxXa-vA&usqp=CAU)



![](https://statkclee.github.io/r-novice-gapminder/fig/13-dplyr-fig3.png)

### ⑨ 파생변수 추가

```R
score <- read.table("성적.txt", header=T)

score %>% mutate(총점 = 국어 + 영어 + 수학, 평균 = 총점/3)

score %>%
mutate(총점 = 국어 + 영어 + 수학, 평균 = 총점/3) %>%
arrange(desc(총점))

score %>%
mutate(총점 = 국어 + 영어 + 수학, 결과 = ifelse(총점 >= 20, "pass", "fail"))
```

![image-20210311085055505](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210311085055505.png)

![image-20210311085101612](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210311085101612.png)

![image-20210311085107246](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210311085107246.png)

![image-20210311085122991](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210311085122991.png)





### ⑩ 둘 이상의 데이터 프레임 결합

열(columns)이 서로 동일하지 않아도 행(rows) 기준으로 합칠 수 있음 'id' 매개변수를 사용해 합쳐지기 전 데이터 프레임의 원천을 알 수 있음 dplyr 패키지의 처리 속도가 기본 패키지의 rbind() 대비 상대적으로 빠름

#### ⓐ bind_rows

두 개 이상의 데이터 프레임을 행 기준(위 - 아래 - 아래 ...)로 합칠 때 사용하는 함수이며, {base] 패키지의 rbind() 함수와 유사 기능을 수행한다.



#### ⓑ bind_cols()

두 개 이상의 데이터 프레임을 열 기준(왼쪽 - 오른쪽 - 오른쪽 ...)로 합칠 때 사용하는 함수이며, {base} 패키지의 cbind() 함수와 유사한 기능을 수행한다.

![](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F263BA94E581EF3FD17)

### ⑪ 조인

두 개의 dataframe을 선택된 공통의 변수에 기반하여 결합한다.
결합하는 경우 두 개의 인자의 위치에 따른 4가지의 결합기준을 이용할 수 있다.



|            left_join             |              right_join               |          inner_join          |         full_join          |
| :------------------------------: | :-----------------------------------: | :--------------------------: | :------------------------: |
| 왼쪽 자료의 항목을 기준으로 결합 | 오른쪽 쪽 자료의 항목을 기준으로 결합 | 두 자료의 공통 항목만을 결합 | 두 자료의 모든 항목을 결합 |





![](data:image/png;base64,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)





![](data:image/png;base64,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)

### ⑫ 데이터 정제

빠진 데이터(결측치), 이상한 데이터(이상치) 제거하기

```R
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss2 <- na.omit(df)
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)
summarise()에서 na.rm = T사용하기
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))
exam %>% summarise(mean_math = mean(math, na.rm = T),
sum_math = sum(math, na.rm = T),
median_math = median(math, na.rm = T))
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
mean(exam$math)
```



#### ⓐ 결측치

==결측치(Missing Value)==  누락된 값, 비어있는 값
함수 적용 불가, 분석 결과 왜곡하므로 제거 후 분석 실시
결측치 표기 - 대문자 NA

```R
df <- data.frame(sex = c("M", "F", NA, "M", "F"), score = c(5, 4, 3, 4, NA))
```



##### ⑴ 결측치 확인하기

```R
is.na(df)
table(is.na(df))
```



##### ⑵ 변수별로 결측치 확인하기

```R
table(is.na(df$sex))
table(is.na(df$score))
```



##### ⑶ 결측치 포함된 상태로 분석

```R
mean(df$score); sum(df$score)
```



##### ⑷ 결측치 있는 행 제거하기

```R
df %>% filter(is.na(score))
df %>% filter(!is.na(score))
```



##### ⑸ 결측치 제외한 데이터로 분석하기

```R
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score); sum(df_nomiss$score)
```





#### ⓑ 이상치

==이상치(Outlier)==  정상범주에서 크게 벗어난 값

```R
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1), score = c(5, 4, 3, 4, 2, 6))
```

##### ⑴ 이상치 확인하기

```R
table(outlier$sex)
table(outlier$score)
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
```



##### ⑵ 이상치를 제외하고 분석

```R
outlier %>%
filter(!is.na(sex) & !is.na(score)) %>%
group_by(sex) %>%
summarise(mean_score = mean(score))
```