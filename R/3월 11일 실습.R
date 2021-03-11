emp <- read.csv("data/emp.csv")
library(dplyr)

# 문제 1 emp 에서 업무가 MANAGER 인 직원들의 정보를 출력
filter(emp,job ==c('MANAGER'))



# 문제 2 emp 에서 사번, 이름, 월급을 출력
emp %>% select(empno,ename,sal)



# 문제 3 emp 에서 사번만 빼고 출력
emp %>% select(-empno)



# 문제 4 emp 에서 ename 과 sal컬럼만 출력
emp %>% select(ename,sal)



# 문제 5 업무별 직원수를 출력
emp %>% count(job)



# 문제 6 월급이 1000 이상이고 3000이하인 사원들의 이름, 월급, 부서번호를 출력

emp %>% filter(sal >= 1000 & sal <= 3000) %>% select(ename,sal,deptno)

filter(emp,sal>=1000 & sal <=3000) %>% select(ename,sal,deptno)



# 문제 7 emp 에서 업무이 ANALYST 가 아닌 사원들의 이름, 직업, 월급을 출력
filter(emp, job != "ANALYST") %>% select(ename,job,sal)



# 문제 8 emp 에서 업무가 SALESMAN 이거나 ANALYST 인 사원들의 이름, 직업을 출력
filter(emp, job == "SALESMAN" | job == "ANALYST") %>% select(ename,job)



# 문제 9 부서별 직원들 월급의 합을 출력
distinct(emp,deptno)
d10 <- emp %>% filter(deptno == 10)
d20 <- emp %>% filter(deptno == 20)
d30 <- emp %>% filter(deptno == 30)

sum(d10$sal) # 부서번호 10의 월급의 합
sum(d20$sal) # 부서번호 20의 월급의 합
sum(d30$sal) # 부서번호 30의 월급의 합



emp %>% group_by(deptno) %>% summarise(sum_sal=sum(sal))

# 문제 10 월급이 적은 순으로 모든 직원 정보를 출력
arrange(emp, sal)

emp %>% arrange(sal)


# 문제 11 월급이 제일 많은 직원의 정보를 출력
arrange(emp, sal) %>% tail(1)

emp %>% arrange(desc(sal)) %>% head(1)

# 문제 12 컬럼명을 sal에서 salary 로 변경하고 comm 에서 commrate 로 변경한 empnew 데이터셋
empnew <- emp %>% rename(salary=sal,commrate=comm)
empnew



# 문제 13 가장 많은 인원이 일하고 있는 부서 번호를 출력
arrange( emp %>% count(deptno))  %>% tail (1) %>% select(deptno)



# 문제 14 각 직원들 이름의 문자 길이를 저장하는 enamelength 라는 컬럼을 추가하고 짧은 순으로 직원의 이름을 출력 ## 처음에 length를 사용했다!
emp %>% 
  mutate(enamelength=(nchar(ename))) %>% 
  arrange(enamelength) %>% 
  select(ename)




# 문제 15 커미션이 정해진 직원들의 명수를 출력
filter(emp, is.na(comm) == F) %>% summarise(n())

filter(emp, is.na(comm) == F) %>% count # 추가 아규먼트 없이 count함수를 세면 전체 개수를 카운트 한다.
filter(emp, !is.na(comm)) %>% count # 추가 아규먼트 없이 count함수를 세면 전체 개수를 카운트 한다.
filter(emp, comm != "NA") %>% count # 적용이 된다.. 인덱싱 방법에서는 불가능. 
