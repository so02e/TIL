# 문제 1
L1 <- list(
  name = c("scott"),
  sal = c(3000)
)

result1 <- L1[[2]] * 2

# 문제 2
L2 <- list(
  "scott",
  c(100,200,300)
)

# 문제 3
L3 <- list(c(3,5,7),
           c("A","B","C")
     )

L3[[2]][1]<-"ALPHA"
L3

# 문제 4 (첫번째 원소(알파)의 각 값에 10을 더하여 출력)
L4 <- list(alpha=0:4,
           beta=sqrt(1:5),
           gamma=log(1:5)
           )

L4[[1]][1] <- L4[[1]][1] + 10
print(L4)

# 문제 5
L5 <- list(data1 = LETTERS[1:26],
           data2 = emp[,c(1:3)],
           data3 = L4
)

L5[[1]][1]
L5[[2]][[2]][c(1:3)] # ename중에서 3개만. 
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

# 문제 10
score <- sample(0:100,1)
grade <- NULL

cat(score, "점은", switch(EXPR = score),{
    if (score < 60)
    grade <- "F"
      else if(score < 70)
        grade <-"D"
      else if(score < 80)
        grade <- "C"
      else if(score < 90)
        grade <- "B"
      else if(score <= 100)
        grade <- "A"
}
    ,"등급입니다")


# for 문 ?

# 문제 11
# (1) 제어문을 사용하지 않고 구현
al <- LETTERS
pha <- letters

alpha <- paste0(al,pha)
alpha

# (2) 제어문의 사용