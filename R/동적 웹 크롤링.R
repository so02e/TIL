install.packages("RSelenium")
library(RSelenium)
# 기동시킨 서버를 접속하는 역할
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
# selenium 서버에 의해 제어되는 브라우저 기동
remDr$open()

# 지정된 URL 요청하고 렌더링
remDr$navigate("http://www.google.com/")

# 태그에 대한 돔 객체 찾기
webElem <- remDr$findElement(using = "css selector", "[name = 'q']")

# 리스트 객체에 담아, input태그에 텍스트 입력하고, 엔터키 자동화
webElem$sendKeysToElement(list("PYTHON", key = "enter"))


remDr$navigate("http://www.naver.com/")
str(remDr)

webElem <- remDr$findElement(using = "css selector", "#query")
webElem$sendKeysToElement(list("PYTHON", key = "enter"))
str(webElem)


# 이해를 돕기 위해 간단한 웹페이지를 크롤링하고 스크래핑 함
url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
remDr$navigate(url)

#단수형으로 노드 추출 using=css selector (리스트 형으로 리턴한다.)
one<-remDr$findElement(using='css selector','div') # 노드 한 개 리턴(webElement 객체)
one$getElementTagName()
one$getElementText()
one$getElementAttribute("style")

# 단수형으로 없는 노드(p 태그) 추출
one<-NULL
one<-remDr$findElement(using='css selector','p') # 없으면 오류 발생

# 만일 오류 발생을 무시하고 싶어서 사용하지만 소용없음, 외부 라이브러리 사용 때문이라 추정(^^)
# 없을 수도 있으면 복수형(findElements()) 사용할것
# try는 발생오류 무시의 의미를 갖고 있는데, 여기에서는 적용되지 않는 특징이 있다.
one<-NULL
try(one<-remDr$findElement(using='css selector','p')) 


#복수형으로 노드 추출
more<-remDr$findElements(using='css selector','div')
sapply(more, function(x) x$getElementTagName()) # 태그 이름만 리턴 (가급적이면 simple 한 형식으로 리턴하는 sapply)
sapply(more, function(x) x$getElementText()) # 컨텐츠만 추출 

#복수형으로 없는 추출
more<-remDr$findElements(using='css selector','p') # 없으면 오류가 발생하지 않음 비어있는 리스트 리턴
print(more)  
if(length(more) == 0) 
  cat("<p> 태그는 없슈\n")
sapply(more, function(x) x$getElementTagName())
sapply(more, function(x) x$getElementText())



url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)

# 클릭 이벤트까지 수행할 수 있다.
one<-remDr$findElement(using='css selector','a:nth-of-type(4)')
one$getElementTagName()
one$getElementText()
one$clickElement() # 클릭이벤트 수행


url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)

one<-remDr$findElement(using='css selector','a:nth-of-type(3)')
one$getElementTagName()
one$getElementText()
remDr$executeScript("arguments[0].click();",list(one)); # 클릭 이벤트 수행. executeScript("자바스크립트 코드")
# 자바스크립트의 가변형, arguments인수를 써서 가변형인자를 받을 수 있다. 내부적으로 하나의 함수로 인식되는 자바스크립트 코드 -> clickElement()가 안먹는 경우가 있어서. 


# [ 네이버 웹툰 댓글 읽기 ]
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)

#단수형으로 노드 추출
more<-remDr$findElement(using='css selector','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
more$getElementTagName()
more$getElementText()

more$clickElement() # 전체 댓글을 클릭.


# 2페이지부터 10페이지까지 링크 클릭하여 페이지 이동하기 
# 페이지 번호의 css 선택자를 확인한다. 
# #cbox_module > div > div.u_cbox_paginate > div > a:nth-child(5) > span
# 자식태그에서 이벤트가 발생하면, 조상태그에도 적용되는 결과가 있어, span 태그의 부모인 a태그에 전달되어 페이지 이동이 일어난다. 

for (i in 4:12) {
  nextCss <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
  nextPage<-remDr$findElement(using='css selector',nextCss)
  nextPage$clickElement()
  Sys.sleep(2)
}

#복수형으로 노드 추출 
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(bestReviewNodes,function(x){x$getElementText()})

#전체 댓글 링크 클릭후에 첫 페이지 내용 읽어오기
totalReview <- remDr$findElement(using='css selector','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()

totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
sapply(totalReviewNodes,function(x){x$getElementText()})



# 링크 클릭으로 AJAX 로 처리되는 네이버 웹툰 댓글 읽어 오기
repl_v = NULL;
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate(url)
#베스트 댓글 내용 읽어오기
doms1<-remDr$findElements(using ="css","ul.u_cbox_list span.u_cbox_contents")
vest_repl <- sapply(doms1,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(vest_repl))

toralReview <- remDr$findElement(using='css','span.u_cbox_in_view_comment')
toralReview$clickElement()
#전체 댓글의 첫 페이지 내용 읽어오기
doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
repl <-sapply(doms2,function(x){x$getElementText()})
repl_v <- c(repl_v, unlist(repl))

repeat { # 다음페이지. 11페이지~ 20페이지를 넘어갈 때 .
  for (i in 4:12) {               
    nextCss <- paste("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span", sep="")                
    try(nextListLink<-remDr$findElement(using='css',nextCss))
    if(length(nextListLink) == 0)   break;
    nextListLink$clickElement()
    Sys.sleep(1)
    
    
    #전체 댓글의 해당 페이지 내용 읽어오기
    doms3<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
    repl <-sapply(doms3,function(x){x$getElementText()})
    repl_v <- c(repl_v, unlist(repl))                
  }
  
  try(nextPage<-remDr$findElement(using='css',
                                  "#cbox_module > div > div.u_cbox_paginate > div > a:nth-child(13) > span.u_cbox_cnt_page"))
  if(length(nextPage) == 0)  break;
  nextPage$clickElement()
  Sys.sleep(1)
  doms2<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
  repl <-sapply(doms2,function(x){x$getElementText()})
  repl_v <- c(repl_v, unlist(repl))        
}
print(repl_v)
write(repl_v, "output/webtoon2.txt")


# [ 아고다 페이지에 올려진 신라스테이 호텔에 대한 전체 페이지 댓글 읽기 ]

url<-'https://www.agoda.com/ko-kr/shilla-stay-yeoksam/hotel/seoul-kr.html?asq=z91SVm7Yvc0eRE%2FTBXmZWCYGcVeTALbG%2FvMXOYFqqcm2JknkW25Du%2BVdjH%2FesXg8ORIaVs1PaEgwePlsVWfwf3sX%2BVNABRcMMOWSvzQ9BxqOPOsvzl8390%2BEhEylPvEiBp0eoREr2xLYHgqmk0Io4J1HYEzEOqyvdox%2BwS6yxHeonB9lh7mJsBIjSBPoMzBLFW01k%2BU8s2bGO6PcSdsu3T30HwabyNzwNYKiv%2BRDxfs%3D&hotel=699258&tick=637215342272&languageId=9&userId=bcb7ecc6-7719-465f-bf29-951e39733c66&sessionId=uouhnqjisace4freagmzbxxc&pageTypeId=7&origin=KR&locale=ko-KR&cid=-1&aid=130243&currencyCode=KRW&htmlLanguage=ko-kr&cultureInfoName=ko-KR&ckuid=bcb7ecc6-7719-465f-bf29-951e39733c66&prid=0&checkIn=2020-05-30&checkOut=2020-05-31&rooms=1&adults=1&childs=0&priceCur=KRW&los=1&textToSearch=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC%20(Shilla%20Stay%20Yeoksam)&productType=-1&travellerType=0&familyMode=off'
remDr$navigate(url)

# 네비게이트 끝나기(렌더링) 도 전에 돔객체를 찾으려고 하면 오류가 발생할 수 있다.
Sys.sleep(3) # 네이게이트 위한 시간 
pageLink <- NULL
reple <- NULL
curr_PageOldNum <- 0
repeat{
  doms <- remDr$findElements(using = "css selector", ".Review-comment-bodyText")
  Sys.sleep(1)
  reple_v <- sapply(doms, function (x) {x$getElementText()})
  print(reple_v)
  reple <- append(reple, unlist(reple_v))
  cat(length(reple), "\n")
  pageLink <- remDr$findElements(using='css',"#reviewSection > div:nth-child(6) > div > span:nth-child(3) > i ")
  remDr$executeScript("arguments[0].click();",pageLink)
  Sys.sleep(2)
  curr_PageElem <- remDr$findElement(using='css','#reviewSection > div:nth-child(6) > div > span.Review-paginator-numbers > span.Review-paginator-number.Review-paginator-number--current')
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())
  cat(paste(curr_PageOldNum, ':', curr_PageNewNum,'\n'))
  
  if(curr_PageNewNum == curr_PageOldNum)  {
    cat("종료\n")
    break; 
  }
  curr_PageOldNum <- curr_PageNewNum;
}
cat(length(reple), "개의 댓글 추출\n")
# 마지막 페이지를 받아오는 방법이웹사이트마다 다르다. 

write(reple,"output/hotel.txt")


# [ 네이버 북 페이지 이번주 베스트북정보 크롤링 ]

site <- "https://book.naver.com/"
remDr$navigate(site)

#bestseller_tab
# #tab_cp_spt_yes24  / #tab_cp_spt_kyobo 한번에 찾으려면. #bestseller_tab > ul.tab_cp_spt > li.aladdin

# #bestseller_tab > ul.tab_cp_spt > li > a <-  li 태그가 있는 a태그를 찾기 위해서는

# 프로그래밍입장에서는 영어로 된 파일명을 만드는 것이 좋다. 따라서 현 상황에서 class 속성을 이용하여 파일명을 만들어내는 것이 좋다. 따라서 getelementattribute에서 클래스 속성을 가져옴. 

booksitenodes <- remDr$findElements(using='css selector', '#bestseller_tab > ul.tab_cp_spt > li > a')
booksites <- sapply(booksitenodes, function(x) {x$getElementAttribute("class")})
booksites <- unlist(booksites); 
booksites <- unlist(strsplit(booksites, ' '))
size <- length(booksites)
booksites <- booksites[seq(1, size, 2)]

for (booksite in booksites) {
  booksitenode <- remDr$findElement(using='css selector', paste0('#tab_cp_spt_',booksite))
  booksitenode$clickElement()
  Sys.sleep(2)
  # 썸네일 이미지 URL
  bookthumbenodes <- remDr$findElements(using='css selector', '#bestseller_list dl>dt:nth-child(1) img')
  bookthumburl <- sapply(bookthumbenodes, function(x) {x$getElementAttribute("src")})
  bookthumburl <- unlist(bookthumburl)
  # 책이름
  booktitlenodes <- remDr$findElements(using='css selector', '#bestseller_list dl>dt:nth-child(2)>a')
  booktitle <- sapply(booktitlenodes, function(x) {x$getElementText()})
  booktitle <- gsub("[[:cntrl:]]", "", booktitle)
  
  df <- data.frame(bookthumburl, booktitle)
  # 디렉토리가 없으면 만들어낸다. 
  if (!dir.exists('output/book')) 
    dir.create('output/book')
  print(df)
  write.csv(df, file=paste0('output/book/', booksite, '.csv'))
}


