# 1. 벡터 생성 함수
## (1) c()

c() 함수는 아규먼트를 원하는 만큼 전달할 수 있다.

```R
v1 <- c(5,2,6,7,1)
```



## (2) seq()

 seq() 함수는 range와 비슷한 성질을 갖는다. 

```R
v2 <- seq(1,9,by=2)
```



## (3) rep()

함수는 데이터 값을 몇 번 반복할지 정하여 데이터셋을 만든다.

```R
v3 <- rep(1,100)
v4 <- rep(1:3,5) # 123의 묶음이 5번씩 반복된다
v5 <- rep(1:3,times=5) # 123의 묶음이 5번씩 반복된다
v6 <- rep(1:3,each=5) # 1,2,3 이 각각 5번씩 반복된다
```



## (4) :

:는 1씩 증가하거나 1씩 감소하여 데이터셋을 만들 때 사용한다.

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

is.character(x) - 문자형

is.logical(x) - 논리형

is.numeric(x) - 수치형

is.double(x) - 실수형

is.integer(x) - 정수형

is.null(x) - 데이터 셋이 비어있음 

is.na(x) - 데이터 셋의 내부에 존재하지 않는 값(결측치)

is.nan(x) : 숫자가 아님

is.finite(x) : 유한대값

is.infinite(x) : 무한대값





# 4. 강제 형변환 함수 : as.

as.character(x)            

as.complex(x)      

as.numeric(x)              

as.double(x)                       

as.integer(x)               

as.logical(x)       






# 5. 자료형 또는 구조 확인 함수

class(x)

str(x)

mode(x)

typeof(x)






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

비교식이 참인 경우의 index값을 추출한다.

```R
which(rainfall > 100) 
# 결과 : 5,6,7,8,9
```

```R
month.name[which(rainfall > 100)] # which에 의해 추출된 5,6,7,8,9에 따른 달의 이름 출력
# 결과 :  "May"       "June"      "July"      "August"    "September"
```



### 3) which.max

which.max는 argument 벡터에서 최대값의 인덱스를 추출한다.

```R
which.max(rainfall) #which.max는 argument 벡터에서 최대값의 인덱스를 추출
month.korname[which.max(rainfall)]
# 결과 : 8
# 결과 : 8월
```



### 4) which.min

which.max는 argument 벡터에서 최소값의 인덱스를 추출한다.

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