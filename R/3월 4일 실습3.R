# 만화 제목, 만화 요약, 만화 평점
site <- "https://comic.naver.com/genre/bestChallenge.nhn?&page="

text <- NULL; navercomic <- NULL

for(i in 1: 20) {
 
   url <- paste(site, i, sep="")
  text <- read_html(url)

  
  
  # 만화 제목
  node1 <- html_nodes(text, xpath=paste0('//h6/a/text()'))
  node1 <- html_text(node1, trim=TRUE)
  print(node1)

  comicName <- node1
  vcomicName <- comicName
  
  # 만화 요약
  node2 <- html_nodes(text, "div.summary")
  node2 <- html_text(node2, trim=TRUE)
  print(node2)
  comicSummary <- node2
  vcomicSummary <- comicSummary
  
  # 만화 평점
  node3 <- html_nodes(text, xpath=paste0('//div[2]/strong'))
  node3 <- html_text(node3, trim=TRUE)
  print(node3)
  
  comicGrade <- node3
  vcomicGrade <- comicGrade
  
  
  page <- data.frame(comicName=vcomicName,comicSummary=vcomicSummary,comicGrade=vcomicGrade)
  navercomic <- rbind(navercomic, page)

}

View(navercomic)
write.csv(navercomic, "output/navercomic.csv")
