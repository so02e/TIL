# 문제 1
v1 <- 1:10
v2 <- v1 * 2
max_v <- max(v2)
min_v <- min(v2)
avg_v <- mean(v2)
sum_v <- sum(v2)
v3 <- v2[-5]

print(v1);print(v2);print(v3);print(max_v);print(min_v);print(avg_v);print(sum_v)

# 문제 2
v4<-seq(1,9,by=2) 
v5<-rep(1,times=5)
v6<-rep(1:3,times=3)
v7<-rep(1:4,each =2)

print(v4);print(v5);print(v6);print(v7)

# 문제 3
nums <- sample(1:100, 10)
print(sort(nums))
print(sort(nums,decreasing = TRUE))
print(nums[nums>50])
print(which(nums<=50))
print(which.max(nums))
print(which.min(nums))

# 문제 4
v8 <- seq(1,10,by=3)
names(v8) <- LETTERS[1:4]
print(v8)

# 문제 5
score <- sample(1:20,5)
myFriend <- c("둘리","또치","도우너","희동","듀크")
paste(score, myFriend, sep="-")

myFriend[which.max(score)] 
myFriend[which.min(score)]
myFriend[which(score>10)]


# 문제 6
count <- sample(1:100,7)
week.korname <- c("일요일","월요일","화요일","수요일","목요일","금요일","토요일")
paste(week.korname, count, sep=":")

week.korname[which.max(count)]
week.korname[which.min(count)]
week.korname[which(count>50)]

