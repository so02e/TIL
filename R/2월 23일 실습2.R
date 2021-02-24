# 문제 1 : 몇개의 관측치를 가지는지, 어떠한 변수가 있는지 -> str() 함수
str(iris)



# 문제 2
df1 <- data.frame(x=c(1,2,3,4,5) ,y=c(2,4,6,8,10))
df1



# 문제 3
df2 <- data.frame(col1=c(1,2,3,4,5), col2=c('a','b','c','d','e'), col3=c(6,7,8,9,10))
df2



# 문제 4
제품명 <- c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)

df3 <- data.frame(제품명, 가격, 판매량)
df3


# class() : 데이터 타입을 체크 하는 함수
class("제품명") # 새로운 (원소하나 짜리의)벡터를 만든 결과. class(100)
class(제품명) # 미리 만들어둔 제품명 벡터를 쓰는 결과
class(df3$제품명) # 데이터 프레임에서 제품명이라는 변수열을 확인하는 결과 




# 문제 5
# (1) 과일 가격 평균
mean(df3$가격)

# (2) 과일 판매량 평균
mean(df3$판매량)




# 문제 6
name <- c("Potter","Elsa","Gates","Wendy","Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85,76,99,88,40)

df4 <- data.frame(
  name = c("Potter","Elsa","Gates","Wendy","Ben"),
  gender = factor(c("M", "F", "M", "F", "M")),
  math = c(85,76,99,88,40)
)

str(df4)

df4$stat <- stat <- c(76,73,95,82,35) 
df4$score <- score <- df4$math + df4$stat 
df4$grade <- grade <- ifelse(df4$score>=150,"A",
                             ifelse(df4$score>=100,"B",
                                    ifelse(df4$score>=70,"C","D")))
df4




# 문제 7
myemp <- read.csv("data/emp.csv") # 캐릭터 데이터에 stringASFactor = true 
                            # -> 팩터형으로 인식되도록 하려면 매개변수에 추가한다.
str(myemp) 



# 문제 8
myemp[c(3,4,5),]
# myemp[3:5,] # 행만 출력



# 문제 9
myemp[-1]
myemp[,-1]



# 문제 10
# (1) 컬럼이 하나인 경우는 데이터 프레임 구조가 깨지고 벡터로 출력되는 것이 기본
myemp[,c("ename")]
myemp$ename # $로는 하나의 컬럼만을 꺼낼 수 있다.
myemp[,2]

# (2) 다음 두 행은 데이터 프레임 구조가 깨지지 않고 출력되는 특징
myemp[2]
myemp["ename"]




# 문제 11
myemp[,c("ename","sal")]



# 문제 12 직무가 SALESMAN 인 사원의 이름, 월급, 직업을 출력한다.
# (1) 비교식 이용
myemp[myemp$job == "SALESMAN", c("ename","sal","job")]

# (2) subset() 이용 : myemp$를 생략하고 컬럼명만 줄 수도 있다. 
subset(myemp, job =="SALESMAN", c("ename","sal","job")) 




# 문제 13 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다..
subset(myemp, sal >= 1000 & sal <= 3000 , c("ename","sal","deptno")) 



# 문제 14 직무가 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.
subset(myemp, myemp$job !="ANALYST", c("ename","job","sal")) 



# 문제 15 직무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.
subset(myemp, job =="SALESMAN" | job =="ANALYST", select = c("ename","job")) 



# 문제 16 커미션이 정해지지 않은 직원의 이름과 월급 정보를 출력한다.
# 1) 인덱싱
myemp[is.na(myemp$comm),c("ename","sal")] 

# 2) subset() 이용
subset(myemp,is.na(myemp$comm),c("ename","sal"))


## is.na 와 !is. na <컬럼의 값이 NA 이다. = 정해지지 않음>
myemp[is.na(myemp$comm),] #NA 만 출력
myemp[!is.na(myemp$comm),] # NA 아닌 것만 출력




# 문제 17 : 월급이 적은 순으로 모든 직원 정보를 출력한다.
# sort(myemp) # 데이터 프레임을 가지고 sort는 불가능하다.
sort(myemp$sal)



# order함수는 데이터프레임 함수 sort에서 쓰인다. 행의 인덱스를 통해 데이터 프레임을 정렬할 수 있다.
order(myemp$sal) #  [1]  1 12 11  3  5 14 10  2  7  6  4  8 13  9

#order함수의 결과를 행의 인덱스 대신에 사용한다. 
myemp[order(myemp$sal),]
myemp[c(order(myemp$sal)),]



# 문제 18 행과 열의 갯수를 점검한다.
dim(myemp)




# 문제 19 부서별 직원이 몇 명인지 출력한다.
table(myemp$deptno)

# summary는 데이터타입이 factor여야 데이터를 세어준다.
myemp$deptno = as.factor(myemp$deptno) #factor(myemp$deptno)
str(myemp)
summary(myemp$deptno)



# 문제 20 직무별 직원이 몇 명인지 출력한다.
table(myemp$job)


