library() # 설치된 패키지 리스트
installed.packages()
search()

install.packages("rvest") 
install.packages("XML")
install.packages("httr")


# [ 예제1 ]
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
text <- read_html(url) # url 문자열
text

nodes <- html_nodes(text, "div") # 태그 선택자  css 선택자에 매칭되는 돔객체를 리턴함

nodes
title <- html_text(nodes) # 컨텐츠의 추출 (찾아온 것 만큼의 컨텐츠를 뽑아 각각의 벡터 원소로 리턴)
title

node1 <- html_nodes(text, "div:nth-of-type(1)") # 첫번째 div태그
node1
html_text(node1)
html_attr(node1, "style")

node2 <- html_nodes(text, "div:nth-of-type(2)") # 두번째
node2
html_text(node2) # 컨텐츠 
html_attr(node2, "style") # 속성값 

node3 <- html_nodes(text, "div:nth-of-type(3)")
node3
html_text(node3)






# [ 예제2 ]
# 웹문서 읽기
url <- "https://www.data.go.kr/tcs/dss/selectDataSetList.do"
html <- read_html(url)
html

# 목록 아이템 추출
title <- html_text(html_nodes(html, "#apiDataList .title")) # css 선택자에 알맞는 돔객체 추출
title # \t,\n 등의 문자들이 나오는데 

# 목록 아이템 설명 추출
desc <- html_text(html_nodes(html, "#apiDataList .ellipsis")) # 해당 데이터셋에 대한 개요출력
desc

# 데이터 정제: 제어문자를 공백으로 대체
## 1. 정규표현식 사용
title <- gsub("[[:cntrl:]]", "", title) ### [[:cntrl:]] Control Character, \n,\r,\t를 뜻한다.
title


# 2. trim = T은 주어진 내용 앞이나 뒤의  공백 문자, 분리 문자를 없애준다. 
title <- html_text(html_nodes(html, "#apiDataList .title"), trim = T)
title


desc

# gsub("[[:cntrl:](</br>)]", "", desc)
desc <- gsub("[[:cntrl:](</br>)∙]", "", desc)
desc

# 데이터 출력
api <- data.frame(title, desc)
api # ∙는 유니코드 U+2219





# [ 예제7 ]
# 한겨레 페이지(XML 패키지 사용)
library(XML)
library(rvest)
imsi <- read_html("http://www.hani.co.kr/")
t <- htmlParse(imsi)

# / 자식
# // 자손

#조상과 태그가 누구이든 간에 id 속성이 다음과 같은 태그 중 div의 자식 div의 자식를 찾는다.
# xpathSApply(,,하고자 하는 작업의 함수)
content<- xpathSApply(t,'//*[@id="main-top01-scroll-in"]/div/div/h4/a', xmlValue); 
content

# 크롬 통해서 copy 가능
#main-top02-scroll-in > div:nth-child(5) > div > h4 > a

# 다른 div도 찾아야하기 때문에 인덱스 규칙을 얻을 수 있다.
# //*[@id="main-top01-scroll-in"]/div[인덱스 규칙]/div/h4/a

# css 선택자가 찾지 못하는 것을 xpath 가 찾기도 한다. 









# [ 예제3 ]
# 단일 페이지(rvest 패키지 사용)
library(rvest)
# 영화 제목과 평점 읽기
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url)#,encoding="CP949") # CP949, EUC-KR, KSC5601 . 
# 이전에는 UTF8, EUC-KR  둘 중에 하나는 반드시 인코딩 정보를 넣어야했지만, read_html이 기능이 좋아져서 굳이 주지 않아도 된다. 

# <meta http-equiv="Content-Type" content="text/html; charset=euc-kr"> 인코딩이 euc-kr이기 떄문
text
#save(text, file="imsi.rda")

# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point
page <- data.frame(title, point)
print(page)






# 영화 제목과 평점, 리뷰글 읽기 
text<- NULL; title<-NULL; point<-NULL; review<-NULL; page<-NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url)

text
#save(text, file="imsi.rda")

# 영화제목
nodes <- html_nodes(text, ".movie")
title <- html_text(nodes)
title
# 영화평점
nodes <- html_nodes(text, ".title em")
point <- html_text(nodes)
point


#리뷰글
#copyxpath : //*[@id="old_content"]/table/tbody/tr[1]/td[2]/text()
#            //*[@id="old_content"]/table/tbody/tr[3]/td[2]/text()
#            //*[@id="old_content"]/table/tbody/tr[10]/td[2]/text()

# 밖에가 더블이면 안에는 단일, 안에가 단일인용부호면 밖은 더블인용. 
# 두번째 td의 내용만 꺼내는 것이 아니라, 모두 비어있는 텍스트 노드로 간주되어버림....
nodes <- html_nodes(text, xpath = "//*[@id='old_content']/table/tbody/tr/td[2]/text()")
review <- html_text(nodes, trim = TRUE) # \t\n\ 분리 문자 제거 
review <- review[nchar(review)>0] # 비어 있는 "" 제거 -> 데이터 프레임을 만들기가 힘들어짐. 리뷰내용이 없는 경우도 있으므로.
review


# 데이터 프레임 만들고 출력
page <- data.frame(title, point,review)
print(page)



# [ 예제4 ] # 리뷰에 NULL 문자열을 주어 데이터 프레임이 만들 수 있도록 
# 영화 제목, 평점, 리뷰글 읽기
text<- NULL; vtitle<-NULL; vpoint<-NULL; vreview<-NULL; page=NULL
url<- "http://movie.naver.com/movie/point/af/list.nhn?"
text <- read_html(url,  encoding="CP949")
text

for (index in 1:10) {
  # 영화제목
  node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
  title <- html_text(node)
  vtitle[index] <- title
  # 영화평점
  node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
  point <- html_text(node)
  vpoint <- c(vpoint, point)
  # 영화리뷰 
  node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
  node <- html_text(node, trim=TRUE)
  print(node)
  review = node[4] 
  vreview <- append(vreview, review)
}
page <- data.frame(vtitle, vpoint, vreview)
View(page)
write.csv(page, "output/movie_reviews1.csv")







# [ 예제5 ]
# 여러 페이지1 (리뷰 글이 빠진 게 너무 많다.)
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.review <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  nodes <- html_nodes(text, ".movie")
  title <- html_text(nodes)
  nodes <- html_nodes(text, ".title em")
  point <- html_text(nodes)
  nodes <- html_nodes(text, xpath="//*[@id='old_content']/table/tbody/tr/td[2]/text()")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  if(length(review) == 10) {
    page <- data.frame(title, point, review)
    movie.review <- rbind(movie.review, page)
  } else {
    cat(paste(i," 페이지에는 리뷰글이 생략된 데이터가 있어서 수집하지 않습니다.ㅜㅜ\n"))
  }
}
write.csv(movie.review, "output/movie_reviews2.csv")







# [ 예제6 ]
# 여러 페이지2
site<- "http://movie.naver.com/movie/point/af/list.nhn?page="
text <- NULL
movie.allreview <- NULL
for(i in 1: 100) {
  url <- paste(site, i, sep="")
  text <- read_html(url,  encoding="CP949")
  for (index in 1:10) {
    # 영화제목
    node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index, ") > td.title > a.movie.color_b"))
    title <- html_text(node)
    vtitle[index] <- title
    # 영화평점
    node <- html_node(text, paste0("#old_content > table > tbody > tr:nth-child(", index,") > td.title > div > em"))
    point <- html_text(node)
    vpoint <- c(vpoint, point)
    # 영화리뷰 
    node <- html_nodes(text, xpath=paste0('//*[@id="old_content"]/table/tbody/tr[', index,"]/td[2]/text()"))
    node <- html_text(node, trim=TRUE)
    print(node)
    review = node[4] # 질문!!
    vreview <- append(vreview, review)
  }
  page <- data.frame(vtitle, vpoint, vreview)
  movie.review <- rbind(movie.allreview, page)
  
}
write.csv(movie.review, "output/movie_reviews3.csv")










