# 문제 1
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

df4$stat <- stat <- c(76,73,95,82,35) 
df4$score <- score <- df4$math + df4$stat 
df4$grade <- grade <- ifelse(df4$score>=150,"A",
                             ifelse(df4$score>=100,"B",
                                    ifelse(df4$score>=70,"C","D")))
df4

# 문제 7
myemp <- read.csv("data/emp.csv")
str(myemp)

# 문제 8
myemp[,c(3,4,5)]

# 문제 9
myemp[-1]

# 문제 10
myemp[,c("ename")]

# 문제 11
myemp[,c("ename","sal")]

# 문제 12 직무가 SALESMAN 인 사원의 이름, 월급, 직업을 출력한다.
subset(myemp, job =="SALESMAN", c("ename","sal","job")) 

# 문제 13 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력한다..
subset(myemp, sal >= 1000 & sal <= 3000 , c("ename","sal","deptno")) 

# 문제 14 직무가 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력한다.
subset(myemp, job !="ANALYST", c("ename","job","sal")) 

# 문제 15 직무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력한다.
subset(myemp, job =="SALESMAN" | job =="ANALYST", c("ename","job")) 

# 문제 16 커미션이 정해지지 않은 직원의 이름과 월급 정보를 출력한다.
myemp[is.na(myemp$comm),c("ename","sal")] 


# 문제 17 : 월급이 적은 순으로 모든 직원 정보를 출력한다.
order(myemp$sal)
myemp[c(order(myemp$sal)),]


# 문제 18 행과 열의 갯수를 점검한다.
dim(myemp)

# 문제 19 부서별 직원이 몇 명인지 출력한다.
table(myemp$deptno)

# 문제 20 직무별 직원이 몇 명인지 출력한다.
table(myemp$job)
