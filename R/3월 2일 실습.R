# 추출된 숫자에 해당하는 알파벳 대문자를 원소값으로 구성된 벡터를 생성하여 리턴하는 코드

v <- sample(1:26,10)
v

# FUN의 반환 값이 1보다 크다면 행렬을 반환하므로, 리턴값 자체가 벡터가 되도록
sapply(v,function(d) result <- c(LETTERS[d]))