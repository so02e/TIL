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