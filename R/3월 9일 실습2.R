# tm 패키지에서 제공되는 DocumentTermMatrix() 와 proxy 패키지를 dist() 등을 이용하여 
# 사과 포도 망고 자몽 귤 오렌지 바나나 복숭아 자두

library(tm)
library(proxy)

duke <- c("사과 포도 망고")
dooly <- c("포도 자몽 자두")
ddochi <- c("복숭아 사과 포도")
douner <- c("오렌지 바나나 복숭아")
gildong <- c("포도 바나나 망고")
heedong <- c("포도 귤 오렌지")

fruit <- c(duke,dooly,ddochi,douner,gildong,heedong)


# (1) 좋아하는 과일이 가장 유사한 친구
cps <- Corpus(VectorSource(fruit))
dtm <- DocumentTermMatrix(cps)
# Encoding(dtm$dimnames$Terms) = 'UTF-8'

as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com

## 코사인
dist(com, method = "cosine")

## 유클리드
dist(com, method = "Euclidean")

print("duke와 ddochi/ duke와 gildong학생이 가장 유사하다")


# (2) 학생들에게 가장 많이 선택된 과일
cps <- VCorpus(VectorSource(fruit))
tdm <- TermDocumentMatrix(cps,control=list(wordLengths = c(1, Inf)))

tdm
summary <- as.matrix(tdm)
(most <- sort(rowSums(summary), decreasing=T))

names(which.max(most))
# order(rowSums(summary))

# (3) 학생들에게 가장 적게 선택된 과일
names(which.min(most))   # 자두와 자몽은 왜 안나오는지
names(which(most==1))