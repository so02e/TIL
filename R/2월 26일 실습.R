# 문제 1
countEvenOdd <- function(vt){
  if (!is.numeric(vt)|!is.vector(vt)) # |와 || 가능 (여러 값들을 가지고 각각 논리연산은 반드시 하나)
    return() 
  else 
  {total <- length(vt)
  even <- 0
  for (i in 1:total) {
    if (vt[i] %% 2 == 0) {
      even <- even+1
      odd <- total-even
      }
    }
    result <- list(even = even, odd = odd)
    return (result)} # 꼭 변수에 담을 필요는 없다..!
}

countEvenOdd(c(1,4,3))
countEvenOdd(c(1,2,3,4,5))






# 문제 2
vmSum <- function(vt){
  if (!is.vector(vt) || is.list(vt)) {
    result <- "벡터만 전달하숑!"
    return(result)
    
    } else if(!is.numeric(vt)){
      print("숫자 벡터를 전달하숑!")
    return(0)
    
      } else
      return(sum(vt))
}

vmSum(c(1,4,3))
vmSum(c(1,2,3,4,5))
vmSum(c(1,"가")) # 1은 문자열이 되어버린다.
vmSum(c("가","1"))
vmSum(data.frame(1,2,3))
vmSum(list(1,2,3)) # 숫자 벡터만 전달하라는 문구가 뜸.. 리스트인 경우에는 is.vector 가 TRUE 가 된다. -> | is.list(vt) 처리필요 






# 문제 3
vmSum2 <- function(vt){
  if (!is.vector(vt) || is.list(vt)) 
    stop("벡터만 전달하숑!") #  에러발생
  else if(!is.numeric(vt)){
    warning("숫자 벡터를 전달하세요")
    return(0)
    } else
      return(sum(vt))
}

vmSum2(c(1,4,3))
vmSum2(c(1,"가"))
vmSum2(data.frame(1,2,3))
vmSum2(list(1,2,3))






# 문제 4
mySum <- function(vt){if (!is.vector(vt)) stop("벡터만 처리가능!")
  else if(any(is.na(vt)))
  {warning("NA를 최저값으로 변경하여 처리함!")
    vs <- vt
    vs <- order(vs)
    vs[1]
    vt[is.na(vt)] <- vs[1]
    # vt[is.na(vt)] <- min(vt,na.rm=T)
    # min 으로 더 간단하게 쓸 수 있음(na.rm 매개변수 이용 - NA를 뺀 나머지 값의 최소값 : min(vt,na.rm=T)
    total <- length(vt)
    odd <- 0 # 어떤 변수든 처음부터 R value를 쓴다는 것은, 값을 사용하겠다는 것인데 이미 만들어져있지 않다면 오류 발생
    for (i in 1:total) {
      if (i %% 2 != 0) odd <- odd + vt[i]
    }
    return(list(oddSum = odd, evenSum =sum(vt)-odd))
  } 
  else if(is.null(vt)) return()
  else{ 
    total <- length(vt)
    odd <- 0
    for (i in 1:total) {
      if (i %% 2 != 0) odd <- odd + vt[i]
    }
    return(list(oddSum = odd, evenSum =sum(vt)-odd))
  }
}

mySum(c(NA,2,3,5))
mySum(data.frame(2))
mySum(1:5)
mySum(c(1,5,2,7,10))


# NA를 제외한 최소값
test <- c(NA,2,3,5)
order(test)
min(test)
min(test,na.rm=T) # na.rm은 NA를 제거한다는 것을 의미한다.
is.na(test)
test[is.na(test)] <- min(test,na.rm=T)
test





# 문제 5
myExpr <- function(f1){
  if (is.function(f1)){
    return (f1(sample(1:45,6))) # 한번만 사용할 위치에다가 바로 작성해도 됨. 
  } 
  else
    stop("수행 안할꺼임!")
}

myExpr(2)
myExpr(mean)
myExpr(max)
myExpr(sort)
myExpr(base::sum) # sum {base}	-> base 패키지의 sum을 사용하겠다는 뜻


#sum 이라는 전역변수가 있어서 함수 사용에 있어 문제가 발생
# 변수명과 기본함수명이 겹치지 않도록 변수명을 설정하도록 우선적으로 생각하자.
sum <- 1
sort
sum






# 문제 6
createVector1 <- function(...){
  p <- c(...) # ...을 가지고 c함수를 만들어 
  if (is.null(p))return()
  else if (any(is.na(p))) return (NA)
  else return (p)
}

createVector1()
createVector1(1,NA,2)
createVector1(1,2,5)
createVector1(1,2,5,F) # 논리가 숫자로 바뀜
createVector1(1,"안녕",123,TRUE) # 숫자가 문자로 바뀜
createVector1(F,T)




# 문제 7
createVector2 <- function(...){
  p <- list(...) # 리스트는 c()함수와 달리 타입을 그대로 유지한다.
  if (is.null(p)) return()
  else return(p)
}

createVector2()
createVector2(1,2,"가나")
createVector2(A = c(1:2),LETTERS,"가나다",TRUE)
createVector2(1,2,5)
createVector2(1,2,5,F) # 논리가 숫자로 바뀜
createVector2(1,"안녕",123,TRUE) # 숫자가 문자로 바뀜
createVector2(F,T)

