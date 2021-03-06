# 문제 1
(v1 <- sample(1:30,10,replace=TRUE)) #중복 허용
v2 <- v1
names(v2) <- letters[26:17]
print(v1); print(v2)



# 문제 2
v<-seq(10,38,by=2) 
(m1 <- matrix(v,nrow=3,byrow=T))# 행 우선
(m2 <- m1 + 100)
(m_max_v <- max(m1))
(m_min_v <- min(m1))
(row_max <- apply(m1, 1, max)) # rowsums rowmins, rowmax는 없기 때문에 apply 함수 이용
(col_max <- apply(m1, 2, max))



# 문제 3
n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m2 <- cbind(n1,n2,n3);colnames(m2) <- NULL
print(m2)



# 문제 4
m3 <- rbind(n1,n2,n3); rownames(m3)<-NULL
print(m3)



# 문제 5
m4 <- m3
rownames(m4) <- c("row1","row2","row3")
colnames(m4) <- c("col1","col2","col3")
print(m4)



# 문제 6
alpha <- matrix(letters[1:6],nrow=2)
add <- c("x","y","z")
alpha2 <- rbind(alpha,add)
      # 아규먼트가 벡터가 올 수도 있고 행렬이 올 수 있다.
alpha4 <- rbind(alpha, c("x","y","z")) 

add2 <- c("s","p")
alpha3 <- cbind(alpha,add2)
alpha5 <- cbind(alpha, c("s","p"))

print(alpha);print(alpha2);print(alpha3)



# 문제 7
a <- array(1:24, dim=c(2,3,4))
print(a)
# 2행 3열 4층의 데이터 출력
a[2,3,4]
# 2행 데이터 출력
a[2,,]
# 1열 데이터 출력
a[,1,]
# 3층 데이터 출력
a[,,3]

# 모든 데이터에 100더하여 출력
a+100

# 4층의 데이터에 100을 곱하여 출력
a[,,4]* 100

# 각 층의 1행, 2열,3열만 출력
a[1,-1,]
a[1,2:3,] # 인덱스에 벡터를 줄 수 있다.

# 2층의 2행 데이터에 100을 더한 값으로 변경
a[2,,2] <- a[2,,2]+100
print(a)

# 1층의 데이터에 2를 뺀 값으로 변경
a[,,1] <- a[,,1] -2
print(a)

# 모든 데이터에 10을 곱한 값으로 변경
 a<- a*10
print(a)

# 삭제
rm(a)

