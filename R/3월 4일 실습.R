# 웹 크롤링에 필요한 라이브러리 로드
library(rvest)
library(XML)
library(httr)


# 1. 내 소스 : html_node, html_text- rvest() 패키지의 사용


title <- NULL; press <- NULL ; vtitle <- NULL; vpress <- NULL

url<- "http://news.daum.net/ranking/popular"
text <- read_html(url)
text


for (index in 1:50) {
  # 뉴스 제목
  node <- html_node(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index,")>div.cont_thumb > strong > a" ))
  title <- html_text(node)
  vtitle[index] <- title
  
  
  # 신문사 명
  node <- html_nodes(text, xpath=paste0('//*[@id="mArticle"]/div[2]/ul[3]/li[', index,"]/div[2]/strong/span"))
  press <- html_text(node)
  vpress[index] <- press
}

page <- data.frame(vtitle, vpress)
View(page)
write.csv(page, "output/daumnews.csv")



############################################################################3

# CASE1
library(rvest)

text<- NULL; newstitle<-NULL; newspapername<-NULL; news<-NULL; page=NULL
url<- "http://media.daum.net/ranking/popular/"
text <- read_html(url,  encoding="UTF-8")
text                    

for (index in 1:50) {   
  # 뉴스의 제목
  ntitle <- html_node(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index, ") > div.cont_thumb > strong > a"))
  title <- html_text(ntitle)
  newstitle[index] <- title
  # 신문사명칭                   
  nname <- html_node(text, paste0("#mArticle > div.rank_news > ul.list_news2 > li:nth-child(", index,") > div.cont_thumb > strong > span"))
  name <- html_text(nname)
  newspapername <- c(newspapername, name)
} 
page <- data.frame(newstitle, newspapername)
View(page)
write.csv(page, "output/news_ranking.csv")    



# CASE2
news <- NULL; newstitle <- NULL;  newspapername <- NULL;

news <- read_html('http://media.daum.net/ranking/popular/')

for (index in 1:50) {
  #타이틀
  node <- html_text(html_node(news, paste0('#mArticle > div.rank_news > ul.list_news2 > li:nth-child(', index, ') > div.cont_thumb > strong > a')))
  newstitle[index] <- node 
  
  #신문사
  node <- html_text(html_node(news, paste0('#mArticle > div.rank_news > ul.list_news2 > li:nth-child(', index, ') > div.cont_thumb > strong > span')))
  newspapername[index] <- node
}
daumnews <- data.frame(newstitle, newspapername)
write.csv(daumnews, 'output/daumnews.csv')


# CASE3
daum <- read_html('https://news.daum.net/ranking/popular/', encoding = "UTF-8")
url1 <- 'div.rank_news > ul.list_news2 > li:nth-child('
url2 <- ") > div.cont_thumb > strong > a"
url3 <- 'div.rank_news > ul.list_news2 > li:nth-child('
url4 <- ') > div.cont_thumb > strong > span'
newstitle <- NULL
newspapername <- NULL
for (i in 1:50) {
  content_title <-paste(url1, i, url2, sep = "")
  content_name <- paste(url3, i, url4, sep = "")
  newstitle[i] <- html_text(html_nodes(daum, content_title))
  newspapername[i] <- html_text(html_nodes(daum, content_name))
}
newstitle
newspapername
news <- data.frame(newstitle, newspapername)
View(news)
write.csv(news, file = "output/daumnews.csv")




# CASE4
library(XML)
library(rvest)
news<- NULL; newstitle<-NULL; newscompany<-NULL; 
imsi <- read_html("http://media.daum.net/ranking/popular/")
t <- htmlParse(imsi)

#for (i in 1:50) {
news1<- xpathSApply(t,'//*[@id="mArticle"]/div/ul/li/div/strong/a', xmlValue); 
news1 

news2<- xpathSApply(t,'//*[@id="mArticle"]/div/ul/li/div/strong/span', xmlValue); 
news2
#}

news <- data.frame(newstitle=news1, newscompany=news2)
View(news)

write.csv(news, "output/daumnews.csv")



# CASE5
library(httr)
library(XML)
library(rvest)

newstitle.nodes <- html_nodes(read_html('http://media.daum.net/ranking/popular'), xpath = '//*[@id="mArticle"]/div[2]/ul[3]/li/div/strong/a')
print(newstitle.nodes)
newstitle <- html_text(newstitle.nodes)
print(newstitle)
newstitle

newspapaername.nodes <- html_nodes(read_html('http://media.daum.net/ranking/popular'), xpath = '//*[@id="mArticle"]/div[2]/ul[3]/li/div[2]/strong/span')
print(newspapaername.nodes)
newspapername <- html_text(newspapaername.nodes)
print(newspapername)

news.info <-data.frame(newstitle, newspapername) 



# 2. 첫번째 리뷰 소스

# 모두 css 선택자를 씀
# newspapername <= c(newspaername,name) 기존벡터에 추가하는 방법

# 3. 


# 4. xapply. 괄호 안에 인덱스에 해당하는 css 선택자에 따라 뽑아오는데, 리스트 언더바 뉴스2의 50개의 li 개가 있는 경우는 50개가 한번에 꺼내지도록 할 수도 있다. (li만 쓴다.)
# 인덱스를 날렸기 때문에 한번에 찾아와 for문을 사용하지 않아도 됨. 



news <- xpathSApply()

ul/li
