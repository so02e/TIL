# 1. R의 데이터 수집

## (1) R 패키지

**API (Application Programming Interface)** 는 자주 사용될 수 있는 기능들을 미리 만들어놓은 프로그램이다. 어떤 언어의 API 인지에 따라 함수로 만들어질 수도, 클래스로 만들어질 수도 있다.

R의 경우에는 대부분 **함수**이다. 여러 함수들을 묶어놓은 것을 **패키지**라고 부르며 패키지 단위로 관리된다.

함수를 사용하고 싶으면, 그 함수를 담고 있는 패키지를 설치해야 한다. 



- `R 패키지`는 R를 가지고 할 수 있는 통계, 분석 그리고 시각화와 관련하여 기능을 정의한 함수들의 묶음이다.
- R 패키지는 R을 설치할 때 함께 설치되는 기본 패키지가 있고 추가로 원하는 기능을 처리해주는 패키지를 찾아 설치할 수 있다.
- CRAN(https://cran.r-project.org/) 사이트에서 모두 검색 가능하고 다운로드 받을 수 있다.
- 일정 규칙에 맞춰 누구나 제작하고 배포할 수 있는 Package를 통해 기능 확장을 유연하게 할 수 있는 큰 장점을 갖고 있다.



### 1) 패키지 관련 함수

- 새로운 R 패키지의 설치 : **install.packages("패키지명")**

- 이미 설치된 R 패키지 확인 : **installed.packages()**

- 설치된 패키지 삭제 :  **remove.packages("패키지명")** 

- 설치된 패키지의 버전 확인 :  **packageVersion("패키지명")** 

- 설치된 패키지 업데이트 : **update.packages("패키지명")** 

- 설치된 패키지 로드 :  **library(패키지명)** 

  ​								     **require(패키지명)** 

- 로드된 패키지 언로드(로드상태 해제) : **detach("package:패키지명")** 

- 로드된 패키지 점검 : **search()** 







## (2) 웹 스크래핑과 웹 크롤링

웹 크롤링 기능이 구현하기 쉽지 않았을 때 인터넷 사이트의 자료를 수작업으로 수집했지만 이는 비효율적이다.

이러한 업무를 자동화시킨 것이 웹 크롤링이다. 

R에서는 **rvest**패키지를 사용하여, 웹페이지의 내용을 가져올 수 있다. 

|                  웹 스크래핑(web scraping)                   |                   웹 크롤링(web crawling)                    |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| 웹 사이트 상에서 원하는 부분에 위치한 정보를 컴퓨터로 하여금 자동으로 추출하여 수집하는 기술 | 자동화 봇(bot)인 웹 크롤러가 정해진 규칙에 따라 복수 개의 웹 페이지를 브라우징 하는 행위 (내용을 끌어옴) |
|                    *원하는 내용을 뽑아냄*                    |                       *내용을 끌어옴*                        |



![](https://miro.medium.com/max/845/0*Gkish79GWSlaJwml.png)





### 1) 스크래핑 하려는 페이지에서 원하는 태그 찾기

#### ① CSS 선택자

스크래핑하려는 페이지에서 원하는 태그를 찾기 위해 `CSS 선택자`를 사용하여 찾을 수 있다.

![](C:\TIL\R\data\selector.png)

![](https://miro.medium.com/max/2291/1*0ACE4i1MCqXCnlBpdQHm3Q.jpeg)



###### <실습 1>

```R
library(rvest)
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url) # url 문자열

# (1) <h1> 태그의 컨텐츠 
h1 <- html_text(html_nodes(text, "h1"))
h1

# (2) <a> 태그의 href 속성값  
a <- html_attr(html_nodes(text, "a"), "href")
a

# (3) <img> 태그의 src 속성값
img <- html_attr(html_nodes(text, "img"), "src")
img

# (4) 첫 번째 <h2> 태그의 컨텐츠
nodes <- html_nodes(text, "h2")
node1 <- html_text(html_nodes(text, "h2:nth-of-type(1)"))
node1

# (5) <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠 (다시)
# [] : 속성 선택자. $는 green 으로 끝나는 ^ green 으로 시작하는 .. (캐럿문자열)

ul <- html_text(html_nodes(text,"ul>li[style$='green']"))
ul

# (6) 두 번째 <h2> 태그의 컨텐츠
node2 <- html_text(html_nodes(text, "h2:nth-of-type(2)"))
node2

# (7) <ol> 태그의 모든 자식 태그들의 컨텐츠 
ol <- html_text(html_nodes(text,"ol>*"))
ol

# (8) <table> 태그의 모든 자손 태그들의 컨텐츠
table <- html_text(html_nodes(text,"table *"))
table

# (9) name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
tr <- html_text(html_nodes(text, "tr:tr.name"))
tr

# (10) target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
td <- html_text(html_nodes(text,"td#target"))
td
```



















#### ② XPath

XPath(XML Path Language)는 W3C의 표준으로 확장 생성 언어 문서의 구조를 통해 경로 위에 지정한 구문을 사용하여 항목을 배치하고 처리하는 방법을 기술하는 언어이다.



Xpath를 이용할 시 `//`의 의미에 대해 잘 알아두자. `//`는 조상이 누구이든 간에의 의미를 갖는다.

`// a /b/c` : `/d/e/t/u/a/b/c` , `/a/b/c` 

`/a//b/c` : `/a/k/b/c`, `/a/k/s/w/b/c`, `/a/b/c`



```xml
<?xml version="1.0" encoding="utf-8"?>
<wikimedia>
  <projects>
    <project name="Wikipedia" launch="2001-01-05">
      <editions>
        <edition language="English">en.wikipedia.org</edition>
        <edition language="German">de.wikipedia.org</edition>
        <edition language="French">fr.wikipedia.org</edition>
        <edition language="Polish">pl.wikipedia.org</edition>
      </editions>
    </project>
    <project name="Wiktionary" launch="2002-12-12">
      <editions>
        <edition language="English">en.wiktionary.org</edition>
        <edition language="French">fr.wiktionary.org</edition>
        <edition language="Vietnamese">vi.wiktionary.org</edition>
        <edition language="Turkish">tr.wiktionary.org</edition>
      </editions>
    </project>
  </projects>
</wikimedia>

```


##### ex 1) 모든 project 요소의 name 속성을 선택

```R
/wikimedia/projects/project/@name
```




##### ex 2) 모든 영문 Wikimedia 프로젝트의 주소(language 속성이 English인 모든 edition 요소의 문자열)를 선택

```R
/wikimedia/projects/project/editions/edition[@language="English"]/text()

//editions/edition[@language="English"]/text()   # // 의 의미는 조상이 누구이든 간에
```



##### ex 3) 모든 위키백과의 주소(Wikipedia의 이름 특성을 가진 project 요소 아래에 존재하는 모든 edition 요소의 문자열)를 선택

```R
/wikimedia/projects/project[@name="Wikipedia"]/editions/edition/text()
```







### 2) 정적 웹페이지 스크래핑 주요 API

정적 웹페이지 스크래핑에 대해 알아보기 전에, 웹과 관련된 개념을 짚어보고 가자.

|           정적 웹페이지            |                       동적 웹페이지                        |
| :--------------------------------: | :--------------------------------------------------------: |
| HTML, CSS 만으로 만들어진 웹페이지 | HTML, CSS, 자바스크립트, jQuery 기능으로 만들어진 웹페이지 |

* DOM 객체

  웹 크롤링으로 만든 것도 내부적으로 DOM 객체가 만들어진다

  기본적으로 각각의 태그별로 부모 - 자식 관계의 계층 구조가 만들어진다.

  일반적으로 **태그**라고 부르지만, DOM 객체의 상태에서는 **노드**라고 한다. (태그 = 노드)




크롤링과 스크래핑과 관련된 패키지는 rvest, XML, httr 패키지가 있고 다음의 코드를 통해 설치하고, 불러올 수 있다.



```R
install.packages("rvest") 
install.packages("XML")
install.packages("httr")


library("rvest") 
library("XML")
library("httr")
```



#### ① `xml2 패키지` (크롤링) - HTML 웹페이지만 가능

` read_html(url)` : **HTML 웹 페이지**를 요청해서 받아오기 



#### ② `httr 패키지` (크롤링) - 이미지나 다른 파일 형식도 가능

`GET(url)` : HTML 웹 페이지를 요청해서 받아오기

​			  	**요청헤더에 계정 또는 패스워드 등의 정보 전달 가능**

​                  **응답 내용이 바이너리인 경우에도 사용 가능**

##### ※ `바이너리 파일`

pdf , 이미지 파일과 같이  메모장으로 열지 못하는 이진파일로 열기 위해서는 특정 프로그램이 필요하다.



`POST()` : POST방식으로 불러오는 함수도 있다.





#### ③ `rvest 패키지` (스크래핑)

##### ⓐ 돔 객체 찾아오기

`html_nodes(x, css, xpath)`, `html_node(x, css, xpath) ` : 원하는 노드(태그) 추출

> xpath 로 찾아오는 경우에는 `xpath = '  '`와 같이 매개변수를 주는 방식으로 찾아온다. 



##### ⓑ 찾아온 객체에서 컨텐츠 추출

`html_text(x, trim=FALSE)` : 노드에서 컨텐츠 추출하기



##### ⓒ 찾아온 객체에서 속성 추출

`html_attrs(x)` : 노드에서 속성 추출하기 

`html_attr(x, name, default = "") ` : 노드에서 주어진 명칭의 속성값 추출하기 





#### ④ `XML 패키지` (스크래핑)

`htmlParse (file, encoding="…")` : xpathSApply() 사용 가능한 객체로 변환

`xpathSApply(doc,Xpath, fun)` : 원하는 노드(태그) 추출하고 전달된 함수 수행하기 

​															(`fun` : xmlValue, xmlGetAttr, xmlAttrs)













## (3) 크롬 개발자 도구 활용

`f12` 키를 눌러 크롬 개발자 도구를 띄운다음, 내가 원하는 path 정보를 얻을 수 있고, 이를 활용하여 웹 크롤링, 스크래핑을 할 수 있다.

![](C:\TIL\R\data\web.png)





몇번째 li인지 달라진다.



css 선택자



xpath



```
# 웹 크롤링에 필요한 라이브러리 로드
library(rvest)
library(XML)
library(httr)

title <- NULL; press <- NULL ; vtitle <- NULL; vpress <- NULL

url<- "http://news.daum.net/ranking/popular"
text <- read_html(url)
text


# html_node, html_text- rvest() 패키지의 사용


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
```















네이버 뉴스

URL로 받아온 페이지 전체. 

만약 , 첫페이지 뿐만 아니라 여러 페이지를 요청하려고 할 때. 







## (4) open API 를 통한 데이터 수집

|                   파일 데이터                    |                           Open API                           |
| :----------------------------------------------: | :----------------------------------------------------------: |
| 승인을 받거나 해 필요할 때 파일을 내려받음(정적) |            회원가입과 신청을 통해 사용할 수 있다.            |
|                                                  | <pre>무료(공개) 데이터를 정해진 URL 문자열을 사용해서 요청하고, </pre></br> 수집할 수 있는 스펙 |

API 는 프로그램을 개발할 때 자주 사용하는 기능을 모아둔 프로그램이다. API 가 함수인 경우와 클래스, 내장 객체인 경우가 있다. 

