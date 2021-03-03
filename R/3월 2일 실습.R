# 추출된 숫자에 해당하는 알파벳 대문자를 원소값으로 구성된 벡터를 생성하여 리턴하는 코드
v <- sample(1:26,10)
v
# FUN의 반환 값이 1보다 크다면 행렬을 반환하므로, 리턴값 자체가 벡터가 되도록
sapply(v,function(d) result <- LETTERS[d]) # 굳이 c()함수에 넣을 필요는 없다.


v2 <- sample(1:26,10)
vran <- function(v){return(LETTERS[v])}
sapply(v2,vran)

# 여러 번 사용할 것이면 함수를 만들어 사용하고, 그렇지 않다면 apply계열의 fun에 함수를 만들어도 된다.