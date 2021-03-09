library(KoNLP)
useSejongDic()
library(wordcloud2)

# 1. 전처리
yes24 <- readLines("output/yes24.txt")
# yes24 <- gsub("[A-z]|[[:punct:]]|[0-9]","",yes24)
yes24 <- gsub("^[가-힣]","",yes24) # 한글만 남기겠다는 의미. RegExCheatsheet 내용 확인

yes24 <- extractNoun(yes24)
yes24 <- unlist(yes24)

word <- Filter(function(x) {nchar(x) >= 2 & nchar(x)<=4}, yes24)
word <- table(word)
word <- sort(word,decreasing =T)
word <- data.frame(word)

# 2. 워드클라우드 로 시각화
result <- wordcloud2(word, fontFamily = "휴먼옛체",col="random-dark")

# 3.yes24.html 로 저장
htmltools::save_html(result,"output/yes24.html")
