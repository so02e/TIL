# 문제 1
L1 <- list(
  name = c("scott"),
  sal = c(3000)
)
L1
result1 <- L1[["sal"]] * 2 # 겹대괄호를 쓰지 않으면, 벡터 객체를 그대로 꺼내는 것이 아니라 리스트로 꺼낸다.
result1
result0 <- L1$sal * 2 # $ 표시를 사용할 수 있다
result0



# 문제 2
L2 <- list(
  "scott",
  c(100,200,300)
)
L2



# 문제 3
L3 <- list(c(3,5,7),
           c("A","B","C")
     )

L3[[2]][1]<-"Alpha" 
L3



# 문제 4 (첫번째 원소(알파)의 각 값에 10을 더하여 출력)
L4 <- list(alpha=0:4,
           beta=sqrt(1:5),
           gamma=log(1:5)
           )
L4
L4[[1]] + 10 
# L4$alpha + 10 
# L4[['alpha']] + 10




# 문제 5
L5 <- list(data1 = LETTERS[1:26],
           data2 = emp[c(1:3),], # emp[1:3,]
           data3 = L4
)
L5
L5[[1]][1] # 겹대괄호 [[]] 로 벡터를 꺼내고, 꺼내진 벡터에서는 단일 대괄호[]를 사용하여, 원소만 추출할 수 있다. 
L5[[2]][[2]] # ename중에서 3개만.
L5[[2]]$ename ; L5$data2$ename
L5[[3]][[3]] # gamma만 출력


# 문제 6
L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
print(mean(unlist(L6)))

# 문제 7
grade <- sample(1:6,1)

if (grade == 1 | grade == 2 | grade == 3){
  cat(grade,"학년은 저학년입니다.")
}else{
    cat(grade,"학년은 고학년입니다.")
}

grade <- as.character(sample(1:6,1))
switch (EXPR = grade,
        "1"=,"2"=,"3"=cat(grade, "학년"),
        "4"=,"5"=,"6"=cat(grade, "학년"))





# 문제 8
choice <- sample(1:5,1)

cat("결과값 : ", switch(EXPR = choice,
                  300+50,
                  300-50,
                  300*50,
                  300/50,
                  300%%50)
    )






# 문제 9
count <- sample(3:10,1)
deco <- sample(1:3,1)

switch(EXPR = deco,
       rep("*",count),
       rep("$",count),
       rep("#",count))



# 참고할만한 소스 추가
count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco==1){
  cat(rep("*",count),"\n")
}else if (deco==2){
  cat(rep("$",count),"\n")
}else {
  cat(rep("#",count),"\n")
}

if (deco==1){
  for(i in 1:count)
    cat("*")
}else if (deco==2) {
  for(i in 1:count)
    cat("$")
}else{
  for(i in 1:count)
    cat("#")
}

(count = sample(3:10,1))
(deco = sample(1:3,1))

if(deco == 1){
  rep("*",count)
}else if(deco == 2){
  rep("$",count)
}else {
  rep("#",count)
} 



count <- sample(3:10, 1)
deco <- sample(1:3, 1)
idx = 1
while (idx <= count) {
  switch(EXPR = deco,
         cat("*"),
         cat("$"),
         cat("#")
  )
  idx <- idx + 1
}





# 문제 10
score <- sample(0:100,1)

# (1) 10으로 나눈 몫을 활용한다.
cat(score, "점은 ", switch(EXPR = score%/%10+1,
                     "F",
                     "F",
                     "F",
                     "F",
                     "F",
                     "F",
                     "D",
                     "C",
                     "B",
                     "A","A"
                     ), "등급입니다."
)

# (2) 리스트를 아규먼트로 받아올 수는 없다.
grade <- c (rep("F",60),
            rep("D",10),
            rep("C",10),
            rep("B",10),
            rep("A",11)
)
 

cat(score, "점은 ", switch(score+1,list(grade)), "점 입니다.")


# (3) char 형으로 바꾸어서

score <- sample(0:100,1)
score 
score <- score %/% 10
level <- switch(EXPR=as.character(score), 
                "10"=, "9"="A등급",
                "8"="B등급",
                "7"="C등급",
                "6"="D등급",
                "F등급")
cat(score,"은 ",level,"입니다\n",sep="")





# 문제 11
# (1) 제어문을 사용하지 않고 구현
al <- LETTERS
pha <- letters

alpha <- paste0(al,pha)
alpha

# (2) 제어문의 사용
alpha2 <- for (i in 1:24){
                          cat(LETTERS[i],letters[i],sep = "","\t")} 
# for 구문이 변수에 들어가지 않는다. for 문 자체가 결과 값을 만들어내는 것은 아니다.
# R-value가 될 수 있는 것은 식만 올 수 있다. (변수,리터럴, 리턴값이 있는 함수 식. for문은 해당되지 않는다.)
