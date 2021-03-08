# 1. 동적 데이터 수집

개발자 도구를 통한 태그 선택으로 데이터를 찾아올 수도 있지만, 

소스 코드안에서는 없는 내용이다.. -> 정적 스크래핑을 할 수 없다.

-> 개발자도구는 자바스크립트 수행이 끝난 상태까지 보여준다. 

**이러한 경우는 정적 데이터 수집이 불가능하다.**



더보기 버튼을 눌러서까지 있는 내용을 보여주고 싶을 떄. ->셀레늄 기술을 활용한다.



게시판의 페이지가 바뀌어도url이 바뀌지 않는 경우 -> Ajax 요청 

개발자 도구 네트워크 창.. -<으로 확인할 수 있따. 





**스크롤을 내리면** 그때 그때 필요한 데이터를 서버에 요청함. 

**버튼을 클릭하면** 그때 그때 필요한 데이터를 서버에 요청함





다음의 경우에는 **웹 페이지의 내용이 동적으로 생성**되는 경우로 지금까지의 방법으로 스크래핑 할 수 없다.

- 사용자의 선택과 같은 **이벤트**에 의해서 **자바스크립트**의 수행 결과로 컨텐츠를 생성한다.

- 페이지의 랜더링을 끝낸 후에 **Ajax 기술**을 이용하여 서버로 부터 컨텐트의 일부를 전송받아 동적으로 구성한다. 

이러한 경우에는 **Selenium** 을 사용하면 제어되는 브라우저에 페이지를 랜더링 해놓고 랜더링된 결과에서 컨텐츠를 읽어올 수 있다. 뿐만 아니라 컨텐츠내에서 클릭이벤트를 발생할 수도 있으며 로그인과 같은 데이터를 입력하는 것도 가능하다.



## (1) Selenium 서버 기동 과정

![](C:\Users\user\Desktop\설치.JPG)



(1) chromedriver.exe, selenium-server-standalone-4.0.0-alpha-1.jar 를 네이버 MBOX 에서 다운로드 하여 c:\xxx\Rexam\selenium 폴더에 저장한다. 

(2) **cmd** 창을 기동시키고 **c:\xxx\Rexam\selenium** 로 옮겨가서 다음 명령을 수행시켜서 **Selenium 서버를 기동**시킨다.

```c
java -Dwebdriver.chrome.driver="chromedriver.exe" -jar selenium-server-standalone-4.0.0-alpha-1.jar -port 4445
```





`remDr <- remoteDriver(remoteServerAddr="localhost",port=4445,browserName="chrome")  ` : R 코드로 Selenium 서버에 접속하고 remoteDriver 객체 리턴  

`remDr$open()` : 브라우저 오픈(크롬)  

`remDr$navigate(url)` : url 에 해당하는 웹페이지 랜더링  



`one <- remDr$findElement(using='css selector',‘css선택자') ` : **태그 한 개 찾기(webElement 객체/태그가 없으면 NoSuchElement 오류 발생**리스트 객체는 $연산자를 쓰는데 변수이름 $  

`one$getElementTagName()` : 찾아진 태그의 태그 명 추출  

`one$getElementText()` : 찾아진 태그의 태그 내용 추출  

`one$getElementAttribute(”속성명”)` : 찾아진 태그의 속성 명에 대한 값 추출  

`one$clickEmenet()` : 찾아진 태그에서 클릭이벤트 발생시키기  





`doms <- remDr$findElements(using ="css selector","컨텐트를추출하려는태그의 CSS선택자")` : 태그들을 찾기 존재하지 않으면 비어있는 **리스트** 리턴 찾은 element객체의 리스트 객체 . 웹 엘리먼트 객체가 3개 만들어져있으면, 이를 담는 엘리먼트 객체 . 장점 : css 에 알맞은 선택자가 있든 없든 선택할 수 있다.  

-> 반복문을 써서 리스트에 담긴 것을 하나하나 꺼내서 get element, clickelement 등을 할 수 있다.복수 개의 데이터를 담고 있는 벡터나 리스트에 대하여 각각의 원소를 하나하나 반복해서 꺼내 처리할 것이다. 그리고 처리한 결과를 하나의 데이터로 만들 때는 sapply.  -> (리스트 객체, 무엇을 할 것인지 함수)



`sapply(doms,function(x){x$getElementText()})` : 찾아진 태그들의 컨텐트들의 추출하여 리스트로 리턴  

-> div 로 태그로 묶은 댓글 컨텐츠들의 

// sapply 를 안쓰고. 

doms[[1]]$getElementText() : 하나만 꺼내올때. doms는 리스트이기 때문에 ?

doms[[2]]$getElementText() : 하나만 꺼내올때. doms는 리스트이기 때문에 ?







`sapply(doms, function(x){x$clickElement()})` : 찾아진 태그들에 각각 클릭 이벤트 발생  (기본적으로 a태그와 submit 이 내장하고 있다.)

`remDr$executeScript("arguments[0].click();",nextPageLink)` : clickable 에러 메세지가 뜰 때 가끔 clickElement() 가 일을 안 할 때가 있음…ㅜ 이 때 사용하면 좋음  / 리스트 객체 두번째 객체로 준다. 





`webElem <- remDr$findElement("css","body")remDr$executeScript("scrollTo(0,document.body.scrollHeight)", args =list(webElem))` : 페이지를 아래로 내리는(스크롤) 효과  



# 2. selenium


```R
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



```



### 1.셀레늄으로 검색 : sendKeysToElement

```R
webElem <- remDr$findElement(using = "css selector", "[name = 'q']")
webElem$sendKeysToElement(list("JAVA", key = "enter")) # 검색 기능
```

리턴된 element객체에 전달할 객체와 키 정보







# 3.  findElement

```R
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



```









# 4. findElements

```R
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




```





# 5(1) 클릭이벤트 findelement

```R
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)

# 클릭 이벤트까지 수행할 수 있다.
one<-remDr$findElement(using='css selector','a:nth-of-type(4)')
one$getElementTagName()
one$getElementText()
one$clickElement() # 클릭이벤트 수행



```



# 5(2) 클릭이벤트 executeScript

```R
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
remDr$navigate(url)

one<-remDr$findElement(using='css selector','a:nth-of-type(3)')
one$getElementTagName()
one$getElementText()
remDr$executeScript("arguments[0].click();",list(one)); # 클릭 이벤트 수행. executeScript("자바스크립트 코드")
# 자바스크립트의 가변형, arguments인수를 써서 가변형인자를 받을 수 있다. 내부적으로 하나의 함수로 인식되는 자바스크립트 코드 -> clickElement()가 안먹는 경우가 있어서. 
```

 

명견만리에서 스크롤 다운 이벤트를 처리할 때도 execute script 를 사용한다.





# * 참고 

css 선택자 

자손 자식

```
#review-0 > div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText

#review-7 > div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText

#review-19 > div.Review-comment-right > div.Review-comment-bubble > div.Review-comment-body > p.Review-comment-bodyText
```



findelement 를 통해서 태그 = 돔 객체 = 웹 element 객체를 가져온다.







 # 스타벅스 소스

