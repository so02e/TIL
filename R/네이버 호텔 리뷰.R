# 0. 동적 크롤링을 위한 라이브러리 셀레늄 기동
library(RSelenium)

# 1. 서버를 기동시킨 후 접속한다.
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")

# 2. selenium 서버에 의해 제어되는 브라우저 기동시킨다.
remDr$open()

# 3. url 정보를 저장하고 불러온다.
url <- "https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2"
remDr$navigate(url)

# 4. 크롤링
  # /html/body/div/div/div[1]/div[2]/div[6]/div[2]/ul/li/div[2]/p/text()
  # /html/body/div/div/div[1]/div[2]/div[6]/div[2]/ul/li[4]/div[2]/p/text()

# (1) 첫 페이지의 리뷰 가져오기 
  # doms1 <- remDr$findElements(using="xpath",value='/html/body/div/div/div[1]/div[2]/div[6]/div[2]/ul/li/div[2]/p/text()')
  # body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li:nth-child(2) > div.review_desc
  # body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li:nth-child(4) > div.review_desc

repl_v = NULL;

doms1<-remDr$findElements(using ="css selector","body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li > div.review_desc > p")
vest_repl <- sapply(doms1,function(x){x$getElementText()})
vest_repl
repl_v <- c(repl_v, unlist(vest_repl))
repl_v

# (2) 모든 페이지의 리뷰 가져오기 
# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > span:nth-child(3) > a

# body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > span:nth-child(6) > a

  
  repeat{
    doms1<-remDr$findElements(using ="css selector","body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > ul > li > div.review_desc > p")
    
    Sys.sleep(1)
    
    vest_repl <- sapply(doms1,function(x){x$getElementText()})
    print(vest_repl)
    
    repl_v <- c(repl_v, unlist(vest_repl))
    repl_v
  
    
    nextCss <- "body > div > div > div.container.ng-scope > div.content > div.hotel_used_review.ng-isolate-scope > div.review_ta.ng-scope > div.paginate > a.direction.next"
    
    nextPage<-remDr$findElement(using='css selector',nextCss)
    nextPage$clickElement()
    Sys.sleep(2)
    
    # 속성값이 disabled이면.
    if (nextPage$getElementAttribute("class")=="direction next disabled"){
      break;
    } 
}


# 5. 저장
write(repl_v, "output/naverhotel.txt")
