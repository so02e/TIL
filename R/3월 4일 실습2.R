# 웹 크롤링에 필요한 라이브러리 로드
library(rvest)
library(XML)
library(httr)
library(jsonlite)

# open api 실습 1 네이버 블로그에서 검색어 '맛집' 
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("맛집","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")

doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc2 <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(doc2, "//item/description", xmlValue)
is.vector(text)
text <- gsub("</?b>", "", text)
text <- gsub("&.+t;", "", text)
text
write.table(text, "output/naverblog.txt")




# open api 실습 2 트위터에서 코로나 라는 단어 검색
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

key <- "코로나"
key <- enc2utf8(key)
result <- search_tweets(key, n=100, token = twitter_token)
str(result)
class(result)
result$retweet_text
content <- result$retweet_text

content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content <- content[complete.cases(content)]
content

write.table(content, "output/twitter.txt")




# open api 실습 3 공공 DB 360버스에 대한 노선 ID, 노선 길이, 기점, 종점, 배차간격
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360" 
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
top <- xmlRoot(doc)
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
df
View(df)


df <- subset(df,select = c(busRouteId,length,stStationNm,edStationNm,term), subset=(busRouteNm==360))
View(df)

names(df) <- c("노선ID", "노선길이", "기점", "종점", "배차간격")

print("[360번 버스정보]")
cat("노선ID : ", df$노선ID)
cat("노선길이 : ", df$노선길이)
cat("기점 : ", df$기점)
cat("종점 : ", df$종점)
cat("배차간격 : ", df$배차간격)





# open api 실습 4 네이버 뉴스에서 빅데이터 검색
searchUrl<- "https://openapi.naver.com/v1/search/news.json"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")

response <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))


json_data <- content(response, type = 'text', encoding = "UTF-8")
json_obj <- fromJSON(json_data)

df <- data.frame(json_obj)
View(df)
df <- df[[5]] # 오류 원인
is.vector(df)


# 문자 제거
df <- gsub("</?b>", "", df)
df <- gsub("&.+t;", "", df)
df
write.table(df, "output/navernews.txt")
