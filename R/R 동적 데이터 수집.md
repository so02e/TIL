# 1. 동적 데이터 수집

다음의 경우에는 웹 페이지의 내용이 동적으로 생성되는 경우에는 지금까지의 방법으로 스크래핑 할 수 없다.

- 사용자의 선택과 같은 이벤트에 의해서 자바스크립트의 수행 결과로 컨텐츠를 생성한다.

- 페이지의 랜더링을 끝낸 후에 Ajax 기술을 이용하여 서버로 부터 컨텐트의 일부를 젂송받아 동적으로 구성한다. 이러한 경우에는 Selenium 을 사용하면 제어되는 브라우저에 페이지를 랜더링 해놓고 랜더링된 결과에서 컨텐츠를 읽어올 수 있다. 뿐만 아니라 컨텐츠내에서 클릭이벤트를 발생할 수도 있으며 로그인과 같은 데이터를 입력하는 것도 가능하다.



## (1) Selenium 서버 기동 과정

(1) chromedriver.exe, selenium-server-standalone-4.0.0-alpha-1.jar 를 네이버 MBOX 에서 다운로드 하여 c:\xxx\Rexam\selenium 폴더에 저장한다. 

(2) cmd 창을 기동시키고 c:\xxx\Rexam\selenium 로 옮겨가서 다음 명령을 수행시켜서 Selenium 서버를 기동시킨다.

```c
java -Dwebdriver.chrome.driver="chromedriver.exe" -jar selenium-server-standalone-4.0.0-alpha-1.jar -port 4445
```





```
webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("JAVA", key = "enter"))
```







| remDr <- remoteDriver(remoteServerAddr="localhost",<br/>port=4445,browserName="chrome") | remDr$open()                                                 |
| :----------------------------------------------------------- | ------------------------------------------------------------ |
| R 코드로 Selenium 서버에 접속하고<br/>remoteDriver 객체 리턴 | 브라우저 오픈(크롬)                                          |
| **remDr$navigate(url)**                                      | **one <- remDr$findElement(using='css selector',‘css선택자')** |
| url 에 해당하는 웹페이지 랜더링                              | 태그 한 개 찾기(webElement 객체)<br/>태그가 없으면 NoSuchElement 오류 발생 |
| **one$getElementTagName()**                                  | **one$getElementText()**                                     |
| 찾아진 태그의 태그 명 추출                                   | 찾아진 태그의 태그 내용 추출                                 |
| **one$getElementAttribute(”속성명”)**                        | **one$clickEmenet()**                                        |
| 찾아진 태그의 속성 명에 대한 값 추출                         | 찾아진 태그에서 클릭이벤트 발생시키기                        |
| **doms <- remDr$findElements(using ="css selector",<br/>"컨텐트를추출하려는태그의 CSS선택자")** | **sapply(doms,function(x){x$getElementText()})**             |
| 태그들을 찾기<br/>존재하지 않으면 비어있는 리스트 리턴       | 찾아진 태그들의 컨텐트들의 추출하여 리스트로 리턴            |
| **sapply(more, function(x){x$clickElement()})**              | **remDr$executeScript("arguments[0].click();",nextPageLink)** |
| 찾아진 태그들에 각각 클릭 이벤트 발생                        | 가끔 clickElement() 가 일을 안 할 때가 있음…ㅜ 이 때 사용하면 좋음 |
| **webElem <- remDr$findElement("css", "body")<br/>remDr$executeScript("scrollTo(0, document.body.scrollHeight)", args =<br/>list(webElem))** |                                                              |
| 페이지를 아래로 내리는(스크롤) 효과                          |                                                              |







```
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.google.com/")
webElem <- remDr$findElement(using = "css", "[name = 'q']")
webElem$sendKeysToElement(list("PYTHON", key = "enter"))
remDr$navigate("http://www.naver.com/")
str(remDr)
webElem <- remDr$findElement(using = "css", "#query")
webElem$sendKeysToElement(list("PYTHON", key = "enter"))
str(webElem)
```





```
url <- "http://unico2013.dothome.co.kr/crawling/tagstyle.html"
remDr$navigate(url)
# 단수형으로 노드 추출 - webElement 객체 리턴
one <- remDr$findElement(using='css selector','div') # 노드 한 개 리턴(webElement 객체)
one$getElementTagName()
one$getElementText()
one$getElementAttribute("style")
# 단수형으로 없는 노드 추출 – 오류 발생
one <- NULL
one <- remDr$findElement(using='css selector','p')
# 만일 오류 발생을 무시하고 싶어서 사용하지만 소용없음, 외부 라이브러리 사용 때문이라 추정(^^)
# 없을 수도 있으면 복수형(findElements()) 사용할것
one <- NULL
try(one<-remDr$findElement(using='css selector','p'))
```







```
#복수형으로 노드 추출 – list 객체 리턴
more <- remDr$findElements(using='css selector','div')
sapply(more, function(x) x$getElementTagName())
sapply(more, function(x) x$getElementText())
#복수형으로 없는 추출 – 비어있는 list 객체 리턴
more <- remDr$findElements(using='css selector','p')
if(length(more) == 0)
cat("<p> 태그는 없슈\n")
```





```
#이벤트 처리
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)
one<-remDr$findElement(using='css selector','a:nth-of-type(4)')
one$getElementTagName()
one$getElementText()
one$clickElement()
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)
one<-remDr$findElement(using='css selector','a:nth-of-type(3)')
one$getElementTagName()
one$getElementText()
remDr$executeScript("arguments[0].click();",list(one));
```



