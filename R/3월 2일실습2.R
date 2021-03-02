# 제시된 memo.txt 파일을 행 단위로 읽어서 벡터를 리턴한다.

memo <- readLines("data/memo.txt",encoding="UTF-8")

memo <- gsub("[[:punct:]]", "", memo)
memo <- gsub("[[:digit:]]", "", memo)

memo <- gsub("되고", "되고,", memo);memo <- gsub("그렇듯이", "그렇듯이,", memo)
memo <- gsub("된다", "된다.", memo);memo <- gsub("마라", "마라!", memo) 
memo <- gsub("진다", "진다.", memo);memo <- gsub("하라", "하라.", memo) 
memo <- gsub("나라", "나라.", memo);memo <- gsub("니다", "니다.", memo) 
memo <- gsub("마세요", "마세요.", memo) 

memo <- gsub("정착", "(정착)", memo)

memo <- gsub("OK", "ok?", memo) 
memo  <- gsub("YOU", "you", memo) 

# 대문자로 시작하는 단어 지우기
memo <- gsub("^[A-Z]","",memo)

memo <- gsub("e", "E", memo) 

memo

write(memo,file="memo_new.txt")
