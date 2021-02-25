# 문제 1
exam1 <- function() return (paste0(LETTERS,letters)) # 두 벡터를 각각의 원소단위로 묶어 출력할 수 있다.
exam1()


# 문제 2
exam2 <- function(number){
    answer <- 0
    for (i in 1:number){
    answer <- answer + i
  }
  return(answer)
}
exam2(4)
exam2(100)


exam2_2 <- function(num){
  return(sum(1:num)) # (1:num까지 구성된 벡터)
}
exam2_2(4)
exam2_2(100)



# 문제 3
exam3 <- function(num1, num2){
  result <- abs(num1 - num2)
  return (result)
}

exam3(10,20)
exam3(20,5)
exam3(5,30)
exam3(6,3)
exam3(3,3)





# 문제 4
exam4 <- function(n1,op,n2){
  if (op == "+")
    result <- n1 + n2
  else if (op == "-")
    result <- n1 - n2
  else if (op == "*")
    result <- n1 * n2
  else if (op == "%/%")
    {if (n1 == 0)
      result <- "오류1"
    else if (n2 == 0)
      result <- "오류2"
    else
      result <- n1 %/% n2}
  else if (op == "%%")
    {if (n1 == 0)
      result <- "오류1"
    else if (n2 == 0)
      result <- "오류2"
    else
      result <- n1 %% n2}
  else
    result <- "규격의 연산자만 전달하세요"
  return (result)
}

exam4(2,"+",4)
exam4(2,"-",4)
exam4(2,"*",4)
exam4(2,"%/%",4)
exam4(2,"%%",4)
exam4(0,"%/%",4)
exam4(0,"%%",4)
exam4(2,"%/%",0)
exam4(2,"%%",0)
exam4(2,"/",5)






# 문제 5
exam5 <- function(num1, str1="#"){
  if (num1 >= 0)
    for (i in 1:num1){
      cat(str1)
    }
  return()
}

exam5(4,"$")
exam5(3,)
exam5(-3,) #NULL 도 출력 되지 않도록?


exam5_2 <- function(a,b="#"){
  if (a <= 0){
    return()
  }
  else {
    for (i in 1:a){
      cat(b)
    }
  }
}

exam5_2(4,"$")
exam5_2(3,)
exam5_2(-3,) 




# 문제 6
exam6 <- function(score){
  end <- length(score) 
  for (i in 1:end) {
    if(is.na(score[i])) # 제일 위로 올려야 하는 이유는 ?
      print("NA는 처리 불가") #NA 우선 처리 !!!! 
    
    else if (score[i] >= 85)
      print(paste(score[i],"점은 상등급입니다")) # cat을 쓰게 되면, paste를 안 써도 된다. 
    else if(score[i] >= 70)
      print(paste(score[i],"점은 중등급입니다"))
    else if(score[i] >= 0)
      print(paste(score[i],"점은 하등급입니다"))
  }
  return()
}

exam6(c(80,50,70,66,NA,35))




exam6_1 <- function(score){
  end <- length(score) 
  for (i in 1:end) {
    if (score[i] >= 85)
      print(paste(score[i],"점은 상등급입니다")) # cat을 쓰게 되면, paste를 안 써도 된다. 
    else if(score[i] >= 70)
      print(paste(score[i],"점은 중등급입니다"))
    else if(score[i] >= 0)
      print(paste(score[i],"점은 하등급입니다"))
    else if(is.na(score[i])) #결과는 무조건 NA이다. NA는 NOT AVAILABLE 결측치(무한대) , TRUE FALSE 자리에 NA가 와버렸기 때문에 오류. 
      print("NA는 처리 불가")  
  }
  return()
}

exam6_1(c(80,50,70,66,NA,35))





# 아직 안 배운 부분 (...)
exam6_2 <- function(...){
  data <- c(...)
  for(score in data){
    if(!is.na(score)){
      if(score >= 85){
        lev = '상'}
      else if(score >= 70){
        lev = "중"}
      else {
        lev = "하"}
      print(paste(score, "점은", lev, '등급입니다.'))
    }
    else {
      print("NA는 처리불가")
    }
  }
  return()
}
  
exam6_2(80,50,70,66,NA,35)
