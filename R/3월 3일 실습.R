library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url) # url 문자열

# (1) <h1> 태그의 컨텐츠 
h1 <- html_text(html_nodes(text, "h1")) # 하나가져오는 것이 확실하므로 html_node를 써도 된다.
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

# (7) <ol> 태그의 모든 자식 태그들의 컨텐츠 (ol>*)
#ol <- html_text(html_nodes(text,"ol>li"))
ol <- html_text(html_nodes(text,"ol>*"))
ol

# (8) <table> 태그의 모든 자손 태그들의 컨텐츠 ("table *)
#table <- html_text(html_nodes(text,"table > tr,th,td"))
table <- html_text(html_nodes(text,"table *"))

table

# (9) name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
tr <- html_text(html_nodes(text, "tr.name"))
tr

# (10) target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
td <- html_text(html_nodes(text,"td#target"))
td
