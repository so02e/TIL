# 웹 크롤링에 필요한 라이브러리 로드
library(rvest)
library(XML)
library(httr)

# [ 예제8 ]
# W3C의 HTTP 프로토콜 스팩에서 Table of Contents 읽기

#(첫번째 방법)
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'), 'div.toc h2') #css 선택자가 두번째 매개변수이기 때문에 (xpath는 xpath = 의 키워드 아규먼트 형식으로 지정) div의 toc클래스 의 자손 h2

#(두번째 방법) # body > div.toc > h2 - copy css selector
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'), 'body > div.toc > h2 ')

#(세번째 방법) # /html/body/div/h2
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'), xpath='/html/body/div/h2')


#(네번째 방법) # //div/h2 -> 조상이 누구이든 간에
title2 = html_nodes(read_html('http://www.w3.org/Protocols/rfc2616/rfc2616.html'),xpath='//div/h2')


title2 = html_text(title2)
title2







# [ 예제8 ]
# 뉴스, 게시판 등 글 목록에서 글의 URL만 뽑아내기 
htxt = read_html("https://news.naver.com/main/list.nhn?mode=LSD&mid=sec&sid1=001")
link = html_nodes(htxt, 'div.list_body a'); length(link)
article.href = unique(html_attr(link, 'href'))
article.href







# [ 예제9 ]
# 이미지, 첨부파일 다운 받기 
# pdf
library(httr)
res = GET('http://cran.r-project.org/web/packages/httr/httr.pdf')
writeBin(content(res, 'raw'), 'c:/Temp/httr.pdf')










# [ 예제10 ]
# jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')
imgs = html_nodes(h, 'img')
img.src = html_attr(imgs, 'src')
for(i in 1:length(img.src)){
  res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i], sep=""))
  writeBin(content(res, 'raw'), paste('c:/Temp/', img.src[i], sep=""))
} 








# [ 예제11 ]
# SNS의 Open API 활용
library(httr)
library(rvest)
library(XML)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("봄","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

# 블로그 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
text
text <- gsub("</?b>", "", text) # </?b> --> <b> 또는 </b>
text <- gsub("&.+t;", "", text) # &.+t; --> &at;, &abct;, &1t;, &111t; ...
text[81]
text






# [ 예제12 ]
# 네이버 뉴스 연동  
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("코로나","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

# 네이버 뉴스 내용에 대한 리스트 만들기		
doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue); 
text
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
text








# [ 예제13 ]
# 트위터 글 읽어오기
install.packages("rtweet")
library(rtweet) 
appname <- "edu_data_collection"
api_key <- "RvnZeIl8ra88reu8fm23m0bST"
api_secret <- "wTRylK94GK2KmhZUnqXonDaIszwAsS6VPvpSsIo6EX5GQLtzQo"
access_token <- "959614462004117506-dkWyZaO8Bz3ZXh73rspWfc1sQz0EnDU"
access_token_secret <- "rxDWfg7uz1yXMTDwijz0x90yWhDAnmOM15R6IgC8kmtTe"
twitter_token <- create_token(
  app = appname,
  consumer_key = api_key,
  consumer_secret = api_secret,
  access_token = access_token,
  access_secret = access_token_secret)

key <- "취업"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
result$retweet_text
content <- result$retweet_text
content
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content








# [ 예제14 ]
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "146"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
str(df)
View(df)

busRouteId <- df[df$busRouteNm == 146, "busRouteId"]
busRouteId


url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
View(df)
str(df)










# [ 예제15 ]
# 서울시 빅데이터- XML 응답 처리
# http://openapi.seoul.go.kr:8088/796143536a756e69313134667752417a/xml/LampScpgmtb/1/100/

library(XML)
key = '796143536a756e69313134667752417a'
contentType = 'xml'
startIndex = '1'
endIndex = '200'
url = paste0('http://openapi.seoul.go.kr:8088/',key,'/',contentType,'/LampScpgmtb/',startIndex,'/',endIndex,'/')

con <- url(url, "rb") 
imsi <- read_html(con)
t <- htmlParse(imsi, encoding="UTF-8")
upNm<- xpathSApply(t,"//row/up_nm", xmlValue) 
pgmNm<- xpathSApply(t,"//row/pgm_nm", xmlValue)
targetNm<- xpathSApply(t,"//row/target_nm", xmlValue)
price<- xpathSApply(t,"//row/u_price", xmlValue)

df <- data.frame(upNm, pgmNm, targetNm, price)
View(df)
write.csv(df, "output/edu.csv")










# [ 예제16 ]
# 한국은행 결제 통계시스템 Open API - JSON 응답 처리
install.packages("jsonlite")
library(jsonlite)
library(httr)
key = '/4WQ7X833TXC370SUTDX4/'
contentType = 'json/'
startIndex = '1'
endIndex = '/100/'

url <- paste0('http://ecos.bok.or.kr/api/KeyStatisticList',key,contentType,'kr/',startIndex,endIndex)
response <- GET(url)
json_data <- content(response, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)
df <- data.frame(json_obj)
df <- df[-1]
names(df) <- c("className", "unitName", "cycle", "keystatName", "dataValue")
View(df)
options(scipen=100)
View(df)