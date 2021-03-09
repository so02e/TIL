# 문제 1 
v1 <- c('Happy','Birthday','to','You')

  # (1) 벡터의 길이
  length(v1)

  # (2) 문자 개수의 합
  nchar(v1)
  sum(nchar(v1))

  install.packages('stringr')
  library('stringr')
  str_count(v1) # 문자 개수의 합
  str_length() # 문자 개수..?

  
  
# 문제 2 "Happy Birthday to You"를 만든다.
  v2 <- paste(v1,collapse = " ") # 벡터들을 하나의 벡터로

	# (1) 벡터의 길이
	length(v2)
	
	# (2) 문자 개수의 합
	nchar(v2)
	
	
	
	
	
	
# 문제 3
	
  v3 <- paste(LETTERS[1:10],c(1:10))
  v3_2 <- paste0(LETTERS[1:10],c(1:10))

  
  
  
  
  
# 문제 4 'Good Morning'을 분할하여 다음과 같은 리스트 형식으로 출력한다.
# 문자열 쪼개기, strsplit -> 결과값이 리스트. 
  v4 <- "Good Morning"
  v4_split <- unlist(strsplit(v4," ")) 

  v4_list <- list(v4_split[1],v4_split[2])
  
  
  ## <부분 문자를 뽑아내는 방법, 아규먼트를 주는 방법이 각각 다르다.>
  # str_sub
  # substr
  # substring
  
  
  
 # 문제 5 : 다음 텍스트 벡터를 단어 단위로 분할한다. 단, 모든 쉼표(,)와 하이픈(-)을 제거한다.
  
  library(KoNLP)
  useSejongDic()	

  v5 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!","That's why we call it the present - from kung fu Panda")
  v5 <- gsub("[,-]","",v5)

  word_v5  <- sapply(v5, extractNoun, USE.NAMES = F)
  unlist(word_v5)
  
  
  
  
  text2 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!","That's why we call it the present - from kung fu Panda")
  text2 <- gsub("[[:punct:]]","",text2)
  text2 <- gsub("\\s{2}"," ",text2) # 블랭크가 2개 이상이면 모두 \\s{2,} # 블랭크가 2개면 \\s{2} <이 행은 띄어쓰기 두개를  하나만>
  unlist(strsplit(text2, " "))

  
  
  
  
# 문제 6

s1 <- c("@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루....")
		
  # (1) 한글만 삭제하여 r1 에 저장 한다.
r1 <- gsub("[가-힣]","",s1) # 대괄호는 값을 나열한다는 의미, -는 가~ 힣까지의 모든 값.

  #	(2) 특수문자들을 삭제하여 r2 에 저장 한다.
r2 <- gsub("[[:punct:]]","",s1)

  #	★ (3) 한글과 특수문자들을 삭제하여 r3 에 저장 한다. ★
# r3 <- gsub("[[가-힣][:punct:]]","",s1) <- 수행 되지 않는다.
r3 <- gsub("[가-힣]|[[:punct:]]","",s1) # 가-힣을 따로 명시하고, or을 통해 다음과 같이 표편해야 한다.

  #	(4) 100을 '백'으로 변환하여 r4에 저장 한다.
r4 <- gsub("100","백",s1)





# 문제 7
# (1) 가장 많이 나온 명사 10개의 명칭과 내림차순으로 구성된 횟수 데이터 프레임 생성
hotelreview <- readLines("output/hotel.txt")
hotelnouns <- extractNoun(hotelreview)
hotelnouns

hotelnoun <- unlist(hotelnouns)

word <- Filter(function(x) {nchar(x) >= 2}, hotelnoun)
word <- table(word)

final <- sort(word, decreasing = T)
result <- head(final, 10)
colnames(result) <- c('wname','wcount') # 이름 바꾸기
result <- data.frame(result)


# (2) hotel_top_word.csv로 저장
write.csv(result,"output/hotel_top_word.csv", row.names=F) # 행이름을 저장하지 않는 것 