# 문제 9
word <- scan("data/iotest2.txt",what="")
summary(as.factor(word)) # 네임 벡터로 만들어주는 것을 알 수 있다.

word2 <- summary(factor(word)) #summary 자체가 네임 벡터이므로 c()함수 안써도 된다.

# which.max는 "인덱스"를 추출할 수 있다.
cat("가장 많이 등장한 단어는",names(which.max(word2)),"이고, 횟수는 ", max(word2), "회 입니다.")
