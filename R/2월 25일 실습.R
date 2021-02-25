# 문제 1
exam1 <- function() return (paste0(LETTERS,letters))
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





# 문제 5
exam5 <- function(num1, str1="#"){
  if (num1 >= 0)
    for (i in 1:num1){
      cat(str1)
    }
  else
  return()
}

exam5(4,"$")
exam5(3,)
exam5(-3,) #NULL 도 출력 되지 않도록?






# 문제 6
exam6 <- function(score){
  end <- length(score)
  for (i in 1:end) {
    if(is.na(score[i])) # 제일 위로 올려야 하는 이유는 ?
      print("NA는 처리 불가")
    else if (score[i] >= 85)
      print(paste(score[i],"점은 상등급입니다"))
    else if(score[i] >= 70)
      print(paste(score[i],"점은 중등급입니다"))
    else if(score[i] >= 0)
      print(paste(score[i],"점은 하등급입니다"))
  }
  return()
}

exam6(c(80,50,70,66,NA,35))
