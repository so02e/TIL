# 1. R 개념 정리

## 1) R에서의 데이터 종류 : 자료형(data type)

### 	(1) 문자형(character) : 문자, 문자열

​		여러개의 문자로 구성되어 있어도, 하나의 문자여도 문자형으로 통일된다.

### 	(2) 수치형(numeric) : 정수(integer) + 실수(double)

### 	(3) 복소수형(complex) : 실수 + 허수

### 	(4) 논리형(logical) 

​		**파이썬**은 **True**, **자바스크립트**는 **true**, **R**은 **TRUE**





리터럴(데이터값) : "", ''

문자형 리터럴(데이터값) : "", ''

수치형 리터럴 : 100, 2.15, 0

논리형 : TRUE(T), FALSE(F)

**NULL** : <u>데이터 셋이 비어있음</u> -> 데이터 셋 자체가 없는 경우

**NA** : 데이터셋의 내부에 존재하지 않는 값 -> 세부적으로 값이 없는 경우, 데이터 셋의 5번째에는 값이 없는 경우

​    	**결측치** 

NaN : 숫자가 아님

Inf : 무한대 값



> 타입체크 함수를 통해 
>
> .은 명칭에 사용할 수 있는 . 
>
> x의 변수의 값이 해당 타입인가?

is.character : 문자형

is.logical - 논리형



* 형 변환 : 문자 > 복소수 > 수치 > 논리형

  -> 문자와 복소수를 연산하면 문자가 된다. 수치와 논리 연산하면 수치ㅏ가 된다.

* 강제형변환 함수 (as. )



## 2) R로 다룰 수 있는 데이터셋의 종류

R은 통계분석 tool 인 만큼, 여러 데이터를 묶고 처리하는 경우가 많다.

`데이터의 종류와 구조` 등에 따라서 **벡터, 행렬, 배열, 데이터프레임, 리스트**의 데이터셋을 만든다.



![](https://img1.daumcdn.net/thumb/R800x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F230EBE375672CF0337)



![](data:image/jpeg;base64,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)



### (1) 벡터

가장 기초적인 데이터셋으로, 1차원으로 사용된다.

기본적으로 열 벡터이다. (출력은 하나의 행처럼 보임)

R은 스칼라는 존재하지 않는다.(하나의 데이터 값도 벡터로 취급되어 길이가 1인 벡터로 취급된다.)

인덱스는 1부터 시작한다. [인덱스]

동일 타입의 데이터로만 구성되어, 다른 타입의 데이터가 저장될 시에 문자형 > 수치형 > 논리형 의 규칙에 따라 저장된다.



#### ① 벡터 생성 방법

```R
# c() 함수는 아규먼트를 원하는 만큼 전달할 수 있다.
v1 <- c(5,2,6,7,1)

# seq() 함수는 range와 비슷한 성질을 갖는다. 
v2 <- seq(1,9,by=2)

# rep() 함수는 데이터 값을 몇 번 반복할지 정하여 데이터셋을 만든다.
v3 <- rep(1,100)
v4 <- rep(1:3,5) # 123의 묶음이 5번씩 반복된다
v5 <- rep(1:3,times=5) # 123의 묶음이 5번씩 반복된다
v6 <- rep(1:3,each=5) # 1,2,3 이 각각 5번씩 반복된다

# :는 1씩 증가하거나 1씩 감소하여 데이터셋을 만들 때 사용한다.
v7 <- 1:10
v8 <- 10:1
```



#### ② 값이 내장된 상수 벡터

LETTERS

letters

month.name

month.abb

pi



#### ④ 주요 함수

```R
# 원소 개수
length()

# 벡터의 요소마다 이름을 부여하는 경우 -> 숫자 인덱스 대신 문자 인덱스를 통해 추출
names()

# 정렬 (원소의 자리바꿈)
sort()

# 정렬 (원소 값을 비교하여, 인덱스로 리턴함) : 데이터 프레임의 정렬에 유용하게 사용됨
order()
```



&  원소마다 비교 . 벡터 연산

&& , 첫번째 원소로만 .. 

|

||



### (2) 행렬(matrix)

2차원의 벡터

할당할 수 있는 값이 정해진 요인. 



#### ① 인덱싱

[행의 인덱싱, 열의 인덱싱]

[행의 인덱싱,]

[,열의 인덱싱]

drop속성 : 행렬 구조 유지 여부



#### ② drop 속성

열을 유지해야할 필요가 없는 경우, 하나의 열, 하나의 행인 경우에는 2차원 구조를 깨뜨리는 것이 기본인데

이것이 싫으면 2차원의 행렬구조를 유지하도록 할 수 있다. **drop**



#### ③ 행렬 생성 방법

* matrix 함수 이용

1. matrix(data=벡터, nrow=행의 개수, ncol =열의 개수, byrow=FALSE)

-

-

-

```R
x1 <-matrix(data=1:8, nrow = 2)
# data는 생략 가능 x1 <-matrix(1:8, nrow = 2)
>> 결과 : 열단위로 먼저 채워진다.
      [,1] [,2] [,3] [,4]
[1,]    1    3    5    7
[2,]    2    4    6    8
```



2. 열 우선으로 채워나간다. byrow = TRUE

|||



* rbind, cbind 함수 이용





#### ④ 주요 함수

`dim(m)` - 행렬이 몇 차원인지 체크

`nrow(행렬)` - 행의개수

`ncol(행렬)` - 열의 개수

`colnames(m) `- 행 이름 

`rownames(m)` - 열 이름

`rowSums(m)`

`colSums(m)`

`rowMeans(m)`

`colMeans(m)`

`apply(m,1또는 2,함수)`: 함수에 함수를 불러오는 ?!

`sum(m)` : 행렬의 모든 원소에 대한 연산

`mean(m)`



### (3) 배열(array)

1, 2, 3, 4차원을 지원한다. 3차원 이상의 경우 배열을 사용한다. (1,2 차원의 경우에는 벡터와 행렬을 주로 이용)

3차원은 여러 개의 matrix를 갖는 형태이다.



동일한 데이터의 데이터를 저장할 수 있다. (벡터, 행렬, 배열의 공통점)



#### ① 인덱싱

행의 인덱싱, 열의 인덱싱, 면(층)의 인덱싱





### (4) 팩터(factor)

정해진 **범주의 값**으로만 구성되는 벡터 (범주형 데이터)

학생들의 몸무게는 값이 굉장히 다양하여 팩터로 구성할 수 없다. 하지만 초등학생의 학년 (1,2,3,4,5,6)의 경우는 정해진 범주가 있기 때문에 팩터로 구성할 수 있다.



API 중 숫자, 문자, 팩터에 따라 결과가 달라지는 경우가 있기 때문에 팩터에 대한 학습이 필요하다.

(팩터는 summary를 할 때 개수를 세준다. )



##### ① 생성방법

> 범주형 데이터는 질적 자료로 측정 대상의 특성을 분류하거나 확인할 목적으로 부여한 값으로 값들의 순서 적용 여부에 따라서 명목형과 순서형으로 나뉜다.



factor(벡터)

factor(벡터[, levels=레벨벡터])

factor() : 명목형

ordered = TRUE 순서형 

```R
score <- c(1,3,2,4,2,1,3,5,1,3,3,3)
f_score <- factor(score) # 팩터 형으로 바꿔줌 
summary(f_score)
levels(f_score)

> f_score
 [1] 1 3 2 4 2 1 3 5 1 3 3 3
Levels: 1 2 3 4 5

> summary(f_score)
1 2 3 4 5 
3 2 5 1 1 

> levels(f_score)
[1] "1" "2" "3" "4" "5"
```





##### ② 레벨 정보 추출

값의 범주를 나타낸다.





### (4) 데이터 프레임

정형 데이터의 경우 주로 '데이터 프레임'을 사용한다.

열 단위로 벡터가 묶어져 있으며, 모든 열의 데이터 개수는 동일해야 한다.

열 단위마다 **서로 다른 유형**의 데이터 타입을 가질 수 있다.

**모든 열의 데이터 개수(행의 개수)는 동일해야 한다.**



ex : csv 파일



##### ① 생성방법

`data.frame(벡터들)` : 열이름은 벡터의 이름으로 자동으로 적용된다.

`data.frame(열이름 = 벡터,)`

자동으로 펙터형.

stringAsFactors= False 가 기본값임

문자열 벡터는 자동으로 펙터로 만들었던 과거 버전. 현재는 아님 false 가 기본..





##### ② 데이터 프레임 변환

`cbind(df, 벡터)` : 없었던 열을 새로 붙이는 경우



`rbind(df, 벡터)` : 없었던 행을 새로 붙이는 경우



##### ③ 데이터 프레임 구조 확인

`str(df)` : 주로 사용된다. 

`dim(df)` : 몇 행 몇 열인지만 알고 싶을 때



##### ④ 인덱싱

`[행의 인덱싱, 열의 인덱싱]`

`[열의 인덱싱]` : 데이터 프레임은 열 단위의 데이터처리가 일반적이기 때문에 대괄호에 컬럼이름, 컬럼 숫자를 하나만 작성할 경우 열의 인덱싱을 인식한다.

`df$컬럼이름` : $는 파이썬의 member 연산자(.)와 동일한 역할을 한다. 

`[[열인덱싱]]`



##### ⑤ 원하는 행, 열의 추출

###### ⓐ 조건식을 넣어 

##### 

###### ⓑ subset(df,select=컬럼명들, subset=(조건))

```R
subset(emp,select = c(ename, job, sal)) #subset 함수의 사용

```





### (5) 리스트 : 데이터 셋을 묶는 역할

**모든 유형의 객체집합**으로 **서로 다른 유형의 데이터셋을 하나로 묶고자 할 때** 사용하며 **가장 자유로운 데이터셋**이다. 

데이터의 집합을 다루는 용도보다는 **"데이터셋을 다루는 용도"**로 쓰인다.

**저장 가능한 데이터의 타입, 데이터셋의 종류에 제한이 없어**, 벡터, 행렬, 배열, 데이터프레임, 리스트, 함수 등의 데이터를 저장할 수 있다. 

리스트는 벡터연산을 지원하지 않기 때문에, 벡터연산을 사용해야 할 때는 `unlist()`를 사용하여 **리스트를 벡터로 반환**하여 리스트를 해제하는 함수를 사용한다.



리스트(List)는 배열과 비교할 때 데이터를 중간 중간에 삽입하는 데 유리한 구조로 설명한다. 물론 그러한 장점은 동일하지만 R에서 리스트는 데이터를 접근한다는 관점에서 다른 언어의 해시 테이블 또는 딕셔너리로 종종 설명된다. 즉, 리스트는 ‘(키, 값)’ 형태의 데이터를 담는 연관 배열Associative Array이다.



또 다른 리스트의 특징은 벡터와 달리 값이 서로 다른 데이터 타입을 담을 수 있다는 점이다. 따라서 “이름”이라는 키에 “홍길동”이라는 문자열 값을 저장하고, “성적”이라는 키에 95라는 숫자 값을 저장할 수 있다.



`[ ]` : 리스트가 포함한 하위 리스트를 뽑아낸다.

`[[ ]] ` `$`: 리스트가 아니라 실제 데이터 값을 추출해낸다.

#### ① 리스트 생성

`list()`는 

````R
a <- list(
		 	a = 1:3,
		 	b = "a string",
		 	c = pi,
		 	d = list(-1,-5)
		 	)
````



![](C:\Users\user\Desktop\캡처.JPG)

리스트가 아니라 벡터로 출력하고 싶을 때는 대괄호 2개 해야 함



## 3) R의 연산자

| {}   | ()   | $                | [], [[]] | ^ ** | -    | :    |
| ---- | ---- | ---------------- | -------- | ---- | ---- | ---- |
| ㅇㅇ |      | 속성 성분의 접근 |          |      |      |      |



| %*% %/% %%               | " " /         | + -  | < > <= >= == != | !    | & && '' | '' '' |      | ''   | <<-  | <- = -> |
| ------------------------ | ------------- | ---- | --------------- | ---- | ------- | ----- | ---- | ---- | ---- | ------- |
| 행렬 곱 연산자/몫/나머지 | 일반적 나누기 |      |                 |      |         |       |      |      |      |         |

 



## 4) R의 데이터 출력

콘솔화면에 데이터를 출력하는 함ㅅ

### (1) print

데이터셋, 데이터를 출력

하나뿐.

```
print(출력 데이터 [, 옵션들])
```



### (2) cat

메시지를 출력할 때

출력할 데이터 값들(숫자, 논리, 문자형 데이터 값)을 원하는 만큼 하나의 행으로 출력할 수 있다.

```
cat(..., 옵션들 ...)
```





## 4) R의 제어문

조건에 따라 수행하도록 할 때

### (1) if

```R
if(조건)
	수행 명령 문장
```



```R
if(조건1)
	수행 명령문장1
else if(조건2)
    수행 명령문장2
else if(조건3)
    수행 명령문장3
else {
	수행 명령문장4
	수행 명령문장5
}

# 수행 명령 문장이 2개 이상일 때는 { } (블럭)으로 구성한다.
```



### (2) ifelse 함수

데이터를 추가하는 경우에 유용하게 쓰인다. 

```R
ifelse(조건, 조건이 참일 때의 명령문1, 조건이 거짓일 때의 명령문 2)
```



### (3) switch 함수

```R
switch(EXPR = 수치 데이터, 식1, 식2, 식3,...)
switch(EXPR = 문자열 데이터, 비교값 1 = 식 1, 비교값 2 = 식 2 ...)
```

식의 결과값에 따라 처리를 할 때 는 switch 함수를 쓰는게 매우 유용하다.



### (4) for

```R
for (변수 in 데이터셋)
	수행명령문장
# 데이터셋의 데이터 개수만큼 for문이 반복된다.
```



### (5) while

어떠한 조건에 따라 반복을 할 때

```R
while (조건)
	수행명령문장
```



### (6) repeat - 무한루프 - break

whilte true와 동일하다.

```
repeat 명령문
```



break는 반복문을 종료하는 역할



### (7) next

continue와 비슷하다. 

반복문 내에서는 화면에 결과를 출력할 때 출력함수(print, cat)를 반드시 사용해야 한다.





## 5) 함수

### (1) 함수 정의



### (2) 함수 호출





## 6) 파일 읽어오기

### (1) CSV : read.csv()

getwd() # setwd('xxx') # getwd : getworkingdirectioy

```R
read.csv("data/score.csv") # 상대주소
read.csv("c:/jsy/Rexam/data/score.csv") # 절대주소
```



```R
read.csv(file.choose())
> 파일 선택 창이 뜸
```





### (2) txt



### (3) xml

### (4) json

### (5) xlsx

### (6) pdf



