# 제시된 memo.txt 파일을 행 단위로 읽어서 벡터를 리턴한다.
# 대괄호로 묶으면, '또는'의 의미를 갖는다.

memo <- readLines("data/memo.txt",encoding="UTF-8")

memo <- gsub("[[:punct:]]", "", memo)
memo <- gsub("[[:digit:]]", "", memo)

# 행 단위로 정규표현식을 줄 수 있다.
memo[6] <- gsub("[[:space:]]", "", memo[6]) # 빌트인 정규 표현식은 항상 대괄호 안에 

memo <- gsub("되고", "되고,", memo);memo <- gsub("그렇듯이", "그렇듯이,", memo)
memo <- gsub("된다", "된다.", memo);memo <- gsub("마라", "마라!", memo) 
memo <- gsub("진다", "진다.", memo);memo <- gsub("하라", "하라.", memo) 
memo <- gsub("나라", "나라.", memo);memo <- gsub("니다", "니다.", memo) 
memo <- gsub("마세요", "마세요.", memo) 

memo <- gsub("정착", "(정착)", memo)

memo <- gsub("OK", "ok?", memo) 
memo  <- gsub("YOU", "you", memo) 

# 대문자로 시작하는 단어 지우기 
memo[4] <- gsub("[A-Z]","",memo[4])
memo[4] <- gsub("[a-z]","",memo[4])

memo <- gsub("e", "E", memo) 

memo

write(memo,file="data/memo_new.txt") # 폴더명/파일명
