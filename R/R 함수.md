# 1. 벡터 생성 함수
## (1) c()

`c()` 함수는 아규먼트를 원하는 만큼 전달할 수 있다.

```R
v1 <- c(5,2,6,7,1)
```



## (2) seq()

 `seq()` 함수는 range와 비슷한 성질을 갖는다. 

```R
v2 <- seq(1,9,by=2)
```



## (3) rep()

`rep()` 함수는 데이터 값을 몇 번 반복할지 정하여 데이터셋을 만든다.

```R
v3 <- rep(1,100)
v4 <- rep(1:3,5) # 123의 묶음이 5번씩 반복된다
v5 <- rep(1:3,times=5) # 123의 묶음이 5번씩 반복된다
v6 <- rep(1:3,each=5) # 1,2,3 이 각각 5번씩 반복된다
```



## (4) :

`:`는 1씩 증가하거나 1씩 감소하여 데이터셋을 만들 때 사용한다.

```R
v7 <- 1:10
v8 <- 10:1
```









# 2. 상수 벡터

> 상수 벡터는 이미 값을 내장하고 있는 벡터로 다음의 것들이 존재한다.

## (1) LETTERS

"A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" 



## (2) letters

"a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"



## (3) month.name

 "January"   "February"  "March"     "April"     "May"       "June"      "July"      "August"    "September" "October"   "November"  "December" 



## (4) month.abb

"Jan" "Feb" "Mar" "Apr" "May" "Jun" "Jul" "Aug" "Sep" "Oct" "Nov" "Dec"



## (5) pi

3.141593








# 3. 타입 체크 함수 : is.

`is.character(x)` - 문자형

`is.logical(x)` - 논리형

`is.numeric(x)` - 수치형

`is.double(x)` - 실수형

`is.integer(x)` - 정수형

`is.null(x)` - 데이터 셋이 비어있음 

`is.na(x)` - 데이터 셋의 내부에 존재하지 않는 값(결측치)

`is.nan(x)` : 숫자가 아님

`is.finite(x)` : 유한대값

`is.infinite(x)` : 무한대값







# 4. 강제 형변환 함수 : as.

`as.character(x)        `    

`as.complex(x)     ` 

`as.numeric(x)  `            

`as.double(x)    `                   

`as.integer(x)`               

`as.logical(x)     `  








# 5. 자료형 또는 구조 확인 함수

`class(x)`

`str(x)`

`mode(x)`

`typeof(x)`








# 6. 인덱스

[] 안에 인덱스의 값을 넣어 원하는 인덱스의 원소를 추출할 수 있다.

편의상 상수 벡터 LETTERS를 이용한 인덱싱 추출을 하였다.



## (1) LETTERS[1]

"A"



## (2) LETTERS[c(3,4,5)]

"C" "D" "E"



## (3) LETTERS[3:5]

"C" "D" "E"



## (4) 특정 인덱스를 제외하고 싶은 경우 : LETTERS[-1]

"B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"



## (5) 논리형 인덱스

논리형 인덱스는 TRUE 인 경우만 출력한다.



## (6) 비교식 인덱스

R에서는 인덱스에 **비교식**을 넣어 적용하여, **원하는 조건에 맞는 값만을 추출**할 수도 있다.







# 7. 주요 함수

## (1) length()

원소 개수를 센다.



## (2) names() 

벡터의 요소마다 이름을 부여하는 경우에 사용한다. 이를 통해 숫자 인덱스 대신 문자 인덱스를 통해 추출,  문자 인덱스를 추출할 수 있게 된다. 

이는 **텍스트 마이닝**에서 주로 쓰이게 된다.

```R
v8 <- seq(1,10,by=3)
names(v8) <- LETTERS[1:4]
print(v8)
# 결과 : A	B	C	D
		1	 4	 7   10
```





## (3) which / which.max / which.min

which는 특정 값의 위치를 찾을 수 있는 함수로 찾고자 하는 값의 인덱스를 반환한다.

```R
rainfall <- c(21.6, 23.6, 45.8, 77.0, 
              102.2, 133.3,327.9, 348.0, 
              137.6, 49.3, 53.0, 24.9) # 강수량 데이터 (월별)
```



### 1) which(값)

값이 위치하고 있는 index를 추출한다.

```R
which(rainfall == 348.0)
# 결과 : 8
```



### 2) which (조건)

`which`는 비교식이 참인 경우의 index값을 추출한다.

```R
which(rainfall > 100) 
# 결과 : 5,6,7,8,9
```

```R
month.name[which(rainfall > 100)] # which에 의해 추출된 5,6,7,8,9에 따른 달의 이름 출력
# 결과 :  "May"       "June"      "July"      "August"    "September"
```



### 3) which.max

`which.max`는 argument 벡터에서 최대값의 인덱스를 추출한다.

```R
which.max(rainfall) #which.max는 argument 벡터에서 최대값의 인덱스를 추출
month.korname[which.max(rainfall)]
# 결과 : 8
# 결과 : 8월
```



### 4) which.min

`which.min`는 argument 벡터에서 최소값의 인덱스를 추출한다.

```R
which.min(rainfall) #which.max는 argument 벡터에서 최소값의 인덱스를 추출
month.korname[which.min(rainfall)]
# 결과 : 1
# 결과 : 1월
```



## (4) sort()

원소의 자리를 바꿔 정렬한다.



## (5) order()

원소 값을 비교하여 정렬하고, **인덱스로 리턴한다.** 

데이터 프레임의 정렬에 유용하게 사용됨



## (6) rev()

역순, reverse하여 값을 보여준다. 실제 벡터를 변화시키는 것은 아니다.



## (7) range()

최소값과 최대값을 보여준다. 





## (8) 통계량

| 최대값 | 최소값 |  평균  |  합   | 기초 통계량 |
| :----: | :----: | :----: | :---: | :---------: |
| max()  | min()  | mean() | sum() |  summary()  |







# 8. 랜덤 추출

## (1) sample(a:b,n)

중복을 허용하지 않고 a에서 b까지의 수에서 n개를 추출한다.



## (2) sample(a:b,replace = T)

중복 허용하여 a에서 b까지의 수에서 n개를 추출한다.







# 9. 글자 붙이기

v1 <- c("Apple", "Banana", "Strawberry")
v2 <- c("Pie","Juice", "Cake")



## (1) paste(v1,v2)

나열된 원소 사이에 공백을 두고 결과값을 추출한다.

"Apple Pie"       "Banana Juice"    "Strawberry Cake"



## (2) paste0(v1,v2)

나열된 원소 사이에 공백 없이 결과값을 추출한다.

"ApplePie"       "BananaJuice"    "StrawberryCake"



## (3) paste(v1,v2,sep=":::")

sep 옵션을 통해 구분자를 설정할 수 있다.

"Apple:::Pie"       "Banana:::Juice"    "Strawberry:::Cake"



## (4) paste(v1,v2,collpase=",")

collapse 옵션을 통해 이어붙여진 결과값의 구분자를 설정할 수 있다.

"Apple Pie,Banana Juice,Strawberry Cake"



## (5) paste(v1,v2,sep="",collapse="-")

sep옵션과 collapse옵션을 동시에 주어 다음과 같은 결과를 얻을 수 있다.

 "ApplePie-BananaJuice-StrawberryCake"







# 10. 행렬 (Matrix) 생성 함수

## (1) matrix(data=벡터, nrow= 행의 개수,ncol=열의 개수) 

### 1) 기본 형식(byrow=FALSE) : 열 우선

열 단위로 먼저 채워진다.

```R
x1 <-matrix(data=1:8, nrow = 2)
# data는 생략 가능 x1 <-matrix(1:8, nrow = 2,byrow=FALSE)
>> 결과 : 열단위로 먼저 채워진다.
      [,1] [,2] [,3] [,4]
[1,]    1    3    5    7
[2,]    2    4    6    8
```



### 2)  byrow = TRUE : 행 우선

행 우선으로 채워진다.

```R
x1 <-matrix(data=1:8, nrow = 2, byrow=TRUE)
# data는 생략 가능 x1 <-matrix(1:8, nrow = 2)
>> 결과 : 행단위로 먼저 채워진다.
      [,1] [,2] [,3] [,4]
[1,]    1    2    3    4
[2,]    5    6    7    8
```





## (2) rbind() , cbind()

### 1) rbind() : 행 단위로 행렬 만듬

```R
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat1 <- rbind(vec1,vec2,vec3); mat1 # 벡터의 이름이 바로 행 이름이 된다

# 결과
     [,1] [,2] [,3]
vec1    1    2    3
vec2    4    5    6
vec3    7    8    9
```





### 2) cbind() : 열 단위로 행렬 만듬

```R
vec1 <- c(1,2,3)
vec2 <- c(4,5,6)
vec3 <- c(7,8,9)
mat2 <- cbind(vec1,vec2,vec3); mat2 # 벡터의 이름이 바로 열 이름이 된다

# 결과
    vec1 vec2 vec3
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```







# 11. 행렬 관련 함수

## (1) 행렬의 차원 : dim(), ncol(), nrow()

`dim(m)` - 행렬이 몇 차원인지 체크

`ncol(행렬)` - 열의 개수

`nrow(행렬)` - 행의 개수



## (2) 행과 열의 이름 : colnames(), rownames()

`colnames(m) `- 열 이름 

```
colnames(m) <- c('c1','c2','c3','c4') # 열 이름 대입
```



`rownames(m)` - 행 이름

```

rownames(m) <- c('r1','r2','r3') # 행 이름 대입

```



## (3) 행렬에서의 연산 : colSums(), rowSums(), colMeans(), rowMeans()

`colSums(m)` : 열 단위의 합

`rowSums(m)` : 행 단위의 합



`colMeans(m) ` : 열 단위의 평균

`rowMeans(m)` : 행 단위의 평균



`sum(m)` : 행렬의 모든 원소에 대한 합 연산

`mean(m)` : 행렬의 모든 원소에 대한 평균 연산



## (4) 행렬에 특정 함수 불러오기 : apply(m,1/2,함수명)

`apply(m,1또는 2,함수)`: 함수에 함수를 불러올 때 사용한다.

```R
apply(x2, 1, sum) # 행 단위 = rowSums

apply(x2, 2, sum) # 열 단위 = colSums

# 3번째 항목은 함수(사용자 정의 함수를 적용할 수 있다.) 
```







# 12. 배열(Array) 생성 함수

## (1) array(데이터, dim=c(행,열,면))

```R
a1 <- array(1:30, dim=c(2,3,5)) # dim 매개변수를 꼭 주어야 하는 array
```







# 13. 팩터(facor)와 범주형 데이터

## (1) 생성방법
factor(벡터)

factor(벡터[, levels=레벨벡터])

factor() : 명목형

ordered = TRUE 순서형 

```R
score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
f_score <- factor(score) # 팩터 형으로 바꿔줌 
summary(f_score)

> f_score
 [1] 1 3 2 4 2 1 3 5 1 3 3 3
Levels: 1 2 3 4 5

> summary(f_score)
1 2 3 4 5 
3 2 5 1 1 

```





## (2)  레벨 정보 추출

값의 범주를 나타낸다.

```R
levels(f_score)
> levels(f_score)
[1] "1" "2" "3" "4" "5"
```



levels로 값의 범주를 지정했으나, 데이터셋에서 범주 이외의 값이 존재한다면, **NA(결측값)**으로 자동적으로 처리된다.





# 14. 데이터 프레임(dataframe) 함수

## (1) 데이터 관련 함수

`data()` : R 자체에 내장되어 있는 데이터셋을 확인할 수 있다.

`head(데이터셋명)` : 데이터의 일부(앞에서 부터 6행)를 확인할 수 있다.

`tail(데이터셋명)` : 데이터의 일부(뒤에서 부터 6행)를 확인할 수 있다.

`View(데이터셋명)` : 데이터셋의 내용을 시각화하여(표) 확인할 수 있다.

`str(데이터셋명)` : 데이터셋의 구조를 확인할 수 있다.

`summary(데이터셋명)`



## (2) 데이터 프레임 생성 함수 : data.frame(벡터들)

### 1) 미리 벡터를 만들고 생성

미리 벡터를 만들어 두었다가 데이터 프레임을 만드는 경우에는 `data.frame(벡터1, 벡터2, 벡터3)`의 형식으로 만든다.

```R
english <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
classnum <- c(1,1,2,2)
df_midterm <- data.frame(
  english, math, classnum) 
```



### 2) 바로 벡터를 만들어 생성

미리 벡터를 만들지 않고 데이터 프레임 생성 함수 안에서 벡터를 만들어 데이터프레임을 만들 수 있다.

벡터의 이름을 설정하지 않았기 때문에 컬럼명은 다음과 같이 데이터값으로 자동적으로 만들어진다.

```R
df_midterm2 <- data.frame(
  c(90, 80, 60, 70), 
  c(50, 60, 100, 20), 
  c(1,1,2,2))

> df_midterm2
  c.90..80..60..70. c.50..60..100..20. c.1..1..2..2.
1                90                 50             1
2                80                 60             1
3                60                100             2
4                70                 20             2
```



### 3) 바로 벡터와 그 벡터의 이름을 만들어 생성

벡터의 이름을 지정했기 때문에 컬럼명은 다음과 같이 벡터의 이름이 컬럼명으로 설정된다.

```R
df_midterm2 <- data.frame(
  영어=c(90, 80, 60, 70), 
  수학=c(50, 60, 100, 20), 
  클래스=c(1,1,2,2))
  
> df_midterm2
  영어 수학 클래스
1   90   50      1
2   80   60      1
3   60  100      2
4   70   20      2  
```



## (3) 데이터 프레임 변환 함수

`cbind(df, 벡터)` : 없었던 열을 새로 붙이는 경우



`rbind(df, 벡터)` : 없었던 행을 새로 붙이는 경우



## (4) 데이터 프레임 구조 확인 함수

`str(df)` : 주로 사용된다. 

`dim(df)` : 몇 행 몇 열인지만 알고 싶을 때



## (5) 데이터 프레임의 인덱싱

`[행의 인덱싱, 열의 인덱싱]`

`[열의 인덱싱]` : 데이터 프레임은 열 단위의 데이터처리가 일반적이기 때문에 대괄호에 컬럼이름, 컬럼 숫자를 하나만 작성할 경우 열의 인덱싱을 인식한다.

`df$컬럼이름` : $는 파이썬의 member 연산자(.)와 동일한 역할을 한다. 

`[[열인덱싱]]`



## (6) 데이터 프레임의 데이터 추출

### 1) 조건식 



### 2) subset함수

subset(df,select=컬럼명들, subset=(조건))

```R
subset(emp,select = c(ename, job, sal)) #subset 함수의 사용

```



## (7) 데이터 프레임의 정렬







# 15. 파일 읽어오기

## (1) csv 파일 : read.csv()

### 1) 상대주소

```R
getwd() # setwd('xxx') # getwd : getworkingdirectioy
read.csv("data/score.csv") # 상대주소
```



### 2) 절대주소

```R
read.csv("c:/jsy/Rexam/data/score.csv") # 절대주소
```



### 3) 불러오기를 통한 파일 선택

```R
read.csv(file.choose())
```







# 16. ifelse()

`ifelse(조건, 조건이 참일 때 명령문 1, 조건이 거짓일 때 명령문2)`

```R
df$result <- ifelse(df$var1>df$var2, 
                    "var1이 크다", "var1이 작다") 
```



**ifelse**를 여러 개 **중첩**하여 사용할 수 있다.