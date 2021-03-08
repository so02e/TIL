
#next에 onclick 속성이 있는지 없는지

#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next
#onclick="goodsPageController.moveControl(1)"



# 0. 동적 크롤링을 위한 라이브러리 셀레늄 기동
library(RSelenium)


# 1. 서버를 기동시킨 후 접속한다.
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")


# 2. selenium 서버에 의해 제어되는 브라우저 기동시킨다.
remDr$open()
site <- 'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(site)


# 3. 2 + 1 행사 탭에 들어가기
#(1) clickElement()
twoplusone <- remDr$findElement(using='css selector','#TWO_TO_ONE')
twoplusone$clickElement()

goods <- NULL
goodsname <- NULL
goodsprice <- NULL



## 4. 모든 페이지
repeat{
  # 정보 추출
  Sys.sleep(3)
  
  twoonenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')
  twoonegoodsname <- sapply(twoonenodes, function(x) {x$getElementText()})
  
  
  Sys.sleep(3)
  twononepricenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
  
  twooneprice <- sapply(twononepricenodes, function(x) {x$getElementText()})
  Sys.sleep(2)
  
  goodsname <- c(goodsname,unlist(twoonegoodsname))
  goodsname
  
  goodsprice <- c(goodsprice,unlist(twooneprice))
  
  

  # 다음 버튼 클릭
  Sys.sleep(2)
  
  nextbutton <- remDr$findElement(using='css selector','#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > div > a.next')
  Sys.sleep(2)
  
  nextbutton$clickElement()
  
  Sys.sleep(2)
  goods <- data.frame(goodsname,goodsprice)
  
  
  if (nextbutton$getElementAttribute("onclick")!=FALSE){
    lasttwoonenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.tit')

    twoonegoodsname <- sapply(lasttwoonenodes, function(x) {x$getElementText()})
    
    lasttwononepricenodes <- remDr$findElements(using='css selector', '#contents > div.cnt > div.cnt_section.mt50 > div > div > div:nth-child(5) > ul > li > div > p.price > span')
    twooneprice <- sapply(lasttwononepricenodes, function(x) {x$getElementText()})
    Sys.sleep(2)
    
    goodsname <- c(goodsname,unlist(twoonegoodsname))
    Sys.sleep(2)
    
    goodsprice <- c(goodsprice,unlist(twooneprice))
    goods <- data.frame(goodsname,goodsprice)
    
    break}
  
  
    
  Sys.sleep(2)
  
  
}


# 5. 데이터 저장
write.csv(goods,"output/gs25_twotoone.csv")