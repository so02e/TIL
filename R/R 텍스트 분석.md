

# 1. 텍스트 분석

## 1) 텍스트 마이닝 개요

**텍스트 마이닝(Text mining)**은 단어의 출현 빈도, 단어 간 관계성 등을 파악하여 유의미한 정보를 추출하는 것이다. 이는 **자연어 처리 기술**을 기반으로 하고 있다.

텍스트 마이닝은 **데이터 마이닝**의 일부로 데이터 마이닝이 **수치데이터와 범주형데이터**에 집중하는 반면, 텍스트 마이닝은 **텍스트 데이터**를 중점적으로 다룬다.

텍스트마이닝을 위해서는 **형태소분석기나 구문분석기**와 같은 **자연어처리 도구**를 잘 사용할 수 있어야 하며 그 외에 다루는 언어에 대해서도 잘 알고 있어야 한다.

소셜 미디어는 **시장 및 고객 정보**를 파악하는데 있어서 점차 그 중요성이 높아지고 있으며 텍스트 마이닝은 많은 양의 비정형 데이터를 분석함으로써 **해당 브랜드나 제품에 대한 다양한 의견과 감성반응**을 살펴볼 수 있다.

텍스트 마이닝을 통해 문서들을 **자동으로 분류**할 수 있고, **문서나 단어들간의 연관성**을 분석할 수 있으며 **텍스트에 담겨있는 감성(즉, 평가, 성향)을 예측**할 수 있고 시간의 흐름에 따른 **이슈들의 변환과정**을 추적할 수 있다.



| 연관성 분석 | 트렌드 분석 | 감성 분석 |
| ----------- | ----------- | --------- |
|             |             |           |





## 2) 자연어 처리

`koNLP`를 사용하는 것이 거의 정형화되어있다.

**자연어 처리 기술**을 바탕으로 사람들이 **작성한 텍스트를 컴퓨터가 분석하여 중요한 단어나 문장들을 추출**할 수 있다. 이를 잘 활용하면 매력적인 뉴스 기사의 헤드라인 작성, 제품에 대한 고객 반응 분석, 우리 브랜드에 대한 고객 생각 등을 알아낼 수 있다.

한국어는 어순이나 조사 등을 영어처럼 명확하게 끊어지지 않는 부분이 있다. 

‘한국어’라는 단어를 분석해 보면 ‘한국어는’, ‘한국어의’, ‘한국어를’ 등의 표현들은 모두 ‘한국어’라는 핵심 단어를 가지고 있다. 하지만 기계적으로 이 표현들을 **각각 다르게 인식할 수도 있으므로 한국어로 된 텍스트를 쪼개는 과정이 영어보다 더 많이 필요하다.** 현재 나와 있는 기술만으로도 텍스트 마이닝을 통하여 충분히 유의미한 인사이트를 도출해낼 수 있다.



자연어 처리는 인간이 사용하는 언어를 컴퓨터가 사용할 수 있게 처리하는 것을 말한다. 애플의 시리(Siri)와 같은 음성인식이나 광학문자판독을 통해서 책에서 글자를 읽어 들이거나 웹 페이지에서 사람이 작성한 글을 로봇을 이용해서 크롤링 하고 해석한 후 어떤 것이 핵심어이고 어떤 것이 주제어인가 등을 알아내기도 하며 글쓴이의 감정이나 상태 등을 알아내기도 한다.



자언어 처리는 형태소분석기, 구문분석기와 같은 사람이 작성한 글이나 대화를 컴퓨터를 통해 해석할 수 있게 하는 소프트웨어를 개발하거나 연구하고 그런 것들을 이용해서 실제로 작업하는 것을 말한다.



- 형태소분석기

형태소를 구분하고 무엇인지 알려주는 것이다.

- 구문분석기

주어, 목적어, 서술어와 같은 형태로 품사보다는 단위가 더 높은 논리적 레벨까지를 처리해주는 것이다. 형태소 분석으로 어절들의 품사를 파악한 후 명사,동사, 형용사 등 의미를 지닌 품사의 단어를 추출해 각 단어가 얼마나 많이 등장했는지 확인한다.



`extractNoun(분석할 문장, 변수)`



리스트로 품사를 리턴하는 extractNoun

sapply("여러 원소를 가진 벡터",extractNoun,USE.NAMES=F)  : 결과를 추출할 때 값이 대한민국: 대한민국으로 나오는 것을 막기 위해서 - 심플한 데이터 셋으로 리턴한다. 



Filter 함수 : 두번째 아규먼트인 데이터셋에 대하여, 첫번째 데이터셋을 가져와 .전달하여 리턴값이 true인 것만 추출함. (함수, 데이터셋) -> sapply 와 비슷하지만 아규먼트의 숫자가 다르다. 



sejongDic

NIADic

S: 기호

F: 외국어

N: 체언(명사, 대명사, 수사)

P: 용언(동사, 형용사)

M: 수식언(관형사, 부사)

I: 독립언(감탄사)

J: 관계언(조사)

E: 어미

X: 접사







## 3) 텍스트 전처리와 tm패키지

### (1) 데이터 정제, 변환

텍스트는 기본적으로 비정형 데이터로서 분석에 불필요한 때로는 분석에 방해가 되는 요소들이 포함되어 있어서 데이터 정제(data cleaning) 작업은 필수이다. 

#### ① 정규표현식

```R
 gsub("A", "", word) 

 gsub("a", "", word) 

 gsub("[Aa]", "", word) 

 gsub("[가-힣]", "", word) 

 gsub("[ ^가-힣]", "", word) 

 gsub("[&^%*]", "", word) 

 gsub("[[:punct:]]", "", word) 

 gsub("[[:alnum:]]", "", word) 

 gsub("[12.34567890]", "", word) 

 gsub("[[:digit:]]", "", word) 

 gsub("[^[:alnum:]]", "", word) 

 gsub("[[:space:]]", "", word) 

 gsub("[[:space:][:punct:]]", "", word)
```



#### ② stringr 패키지

```R
install.packages("stringr")
library(stringr)
```



stringr 패키지 에서 **pattern** 아규먼트에서 정규 표현식을 사용할 수 있다.





#### ③ tm 패키지

tm 패키지에는 텍스트 데이터의 정제작업을 지원하는 다양한 변환함수를 제공한다. `getTransformations()`이라는 함수를 수행시키면 사용 가능한 변환함수의 리스트를 확인할 수 있으며 이 함수들은 `tm_map()` 함수에 인수로 전달하여 변환작업을 처리할 수 있다. 문서에서 문장 부호를 제거하거나, 문자를 모두 소문자로 바꾸거나, 단어의 어간을 추출해주는 스테밍(stemming)을 적용할 수 있다.



데이터 정제작업이 필요한 **코퍼스** 객체를 첫번째 아규먼트, 두번째 아규먼트로 어떤 작업을 줄 것인지 준다.

readLines로 읽는 것이 아니라, `코퍼스`라는 객체를 만들어 적용해야 한다.

```R
tm_map (
	x, # 코퍼스
    FUN # 변환에 사용할 함수
)
```



##### ⑴ 여러 개의 공백을 하나의 공백으로 변환

```R
corp2. <- tm_map(corp1,stripWhitespace)        
```

##### ⑵ 숫자 제거

```R
corp2. <- tm_map(corp2.,removeNumbers)      
```

##### ⑶ 영문 대문자를 소문자로 변환

```R
corp2. <- tm_map(myCorpus, content_transformer(tolower))
```

##### ⑷ 마침표, 콤마, 세미콜론, 콜론 등 문자 제거 (특수문자 삭제)

```R
corp2. <- tm_map(corp2.,removePunctuation)
```

##### ⑸ 기본 불용어 외에 불용어로 쓸 단어 추가

 **기본불용어** : stopwords(나라코드)를 넣으면 그 나라의 불용어가 나오지만 한국어의 불용어는 없다.

```R
stopword2. <- c(stopwords('en'),"and","but")
```

##### ⑹ 불용어 제거하기 (전치사 , 관사 등)       

```R
corp2. <- tm_map(corp2.,removeWords,stopword2.)      
```



#### ④ 코퍼스 (corpus, 말뭉치)

언어학에서 구조를 이루고 있는 텍스트 집합으로 통계 분석 및 가설 검증, 언어 규칙의 검사 등에 사용된다. 텍스트 마이닝 패키지인 **tm에서 문서를 관리하는 기본구조를 Corpus**라 부르며, 이는 텍스트 문서들의 집합을 의미한다.



텍스트 마이닝을 위해 수행해야 할 첫 번째 작업은 비 구조화된 텍스트 즉, **비정형의 텍스트를 구조화된 데이터로 변환하는 것**이다. 텍스트를 구조화하는 방법 가운데 하나로 코퍼스(단어주머니:bag-of-words)접근법이 일반적으로 많이 사용된다. 



코퍼스 접근법은 **분석 대상이 되는 개별 텍스트 즉 문서**(document)를 단어의 집합(주머니)으로 단순화시킨 표현 방법으로서 단어의 순서나 문법은 무시하고 단어의 출현 빈도만을 이용하여 텍스트를 매트릭스로 표현한다. 이 때 생성되는 매트릭스를 term-document-matrix(TDM)또는 document-term-matrix(DTM) 라고 한다.



분석해야 할 텍스트를 문서들의 집합인 코퍼스 형식으로 변환해야 한다. tm 패키지의 Corpus() 함수를 사용한다. 이 함수는 다양한 소스로부터 읽어 들인 텍스트를 텍스트 마이닝을 위한 Corpus 객체로 변환한다. getSources() 함수를 사용하면 사용 가능한 소스객체의 종류를 파악할 수 있다.



코퍼스 객체는 다양한 자원을 통해 만들 수 있다. (소스 객체 : 데이터 프레임, Dir, URI, **Vector**, XML, Zip )



##### ⑴ VectorSource 예제1

다음은 6명의 학생의 점심메뉴 벡터 객체이다.

```R
lunch <- c("커피 파스타 치킨 샐러드 아이스크림", 
		   "커피 우동 소고기김밥 귤",
		   "참치김밥 커피 오뎅",
		   "샐러드 피자 파스타 콜라",
		   "티라미슈 햄버거 콜라",
		   "파스타 샐러드 콜라")
```

1. 벡터 소스 함수를 이용하여 코퍼스 객체를 만든다.

   알맹이는 매트릭스 객체이지만. 

```
cps <- VCorpus(VectorSource(lunch)) # 벡터 소스 함수를 이용하여 코퍼스 객체를 만든다.
tdm <- TermDocumentMatrix(cps) #
tdm
(m <- as.matrix(tdm))
```

![image-20210309140635571](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309140635571.png)

:arrow_right: 텀의 길이가 3자 이상인 것만 만들기 때문에 커피가 보이지 않는다.



:imp: wordLengths에 최소값 최대값 을 준다. Inf는 무한대를 뜻하는 리터럴이다.



```R
cps <- VCorpus(VectorSource(lunch))
tdm <- TermDocumentMatrix(cps,
control=list(wordLengths = c(1, Inf)))
tdm
(m <- as.matrix(tdm))
```
![image-20210309140851284](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309140851284.png)

:arrow_right: 텀의 길이가 3자 이상인 것만 만들기 때문에 커피가 보이지 않는다. 커피는 4명이 먹었구나 금방 알 수 있다. 하지만 행과 열의 개수가 많은 데이터의 경우에는 rowsSums, colSums()함수의 도움을 받는다. 실제로는 matrix객체이다.!



![image-20210309141004467](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309141004467.png)

t() 함수는 전치 행렬을 수행하는 역할을 한다. 행과 열을 바꿔주는 역할을 한다



행렬 곱 연산(com).  샐러드와 먹은 사람과 다른 메뉴를 먹은 사람간의 관계를 알 수 있다. com 은 동시 출현한 단어, 단어간의 관계를 가리킨다.



##### ⑵ VectorSource 예제2

```R
library(tm)
A <- c('포도 바나나 딸기 맥주 비빔밥 여행 낚시 떡볶이 분홍색 듀크 귤')
B <- c('사과 와인 스테이크 배 포도 여행 등산 짜장면 냉면 삼겹살 파란색 듀크 귤 귤')
C <- c('백숙 바나나 맥주 여행 피자 콜라 햄버거 비빔밥 파란색 듀크 귤')
D <- c('귤 와인 스테이크 배 포도 햄버거 등산 갈비 냉면 삼겹살 녹색 듀크')
data <- c(A,B,C,D)
cps <- Corpus(VectorSource(data))

tdm <- TermDocumentMatrix(cps) # 객체에 대한 전반적인 정보만 출력된다. 
inspect(tdm) # 매트릭스 내용 + 객체 전반적 내용까지도 보여준다.

m <- as.matrix(tdm)
v <- sort(rowSums(m), decreasing=T) # 모든 문서에서 단어가 몇번 나왔는지 체크
```



![image-20210309142250500](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309142250500.png)

![image-20210309142346168](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309142346168.png)



![image-20210309142413857](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309142413857.png)



![image-20210309142430953](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309142430953.png)

4개의 문서에서 듀크는 모두 나왔다는 것을 확인할 수 있다. 





```R
<가중치.>
m1 <- as.matrix(weightTf(tdm))
m2 <- as.matrix(weightTfIdf(tdm))
```

단어 가중치 : 문서에서 어떤 단어의 중요도를 평가하기 위해
사용되는 통계적인 수치
**TF : Term Frequency(단어빈도)**
**IDF : Inverse Document Frequency(역문서빈도)**
**DF : Document Frequency(문서빈도)**
**TFIDF : TF X IDF**
특정 문서 내에서 단어 빈도가 높을 수록, 전체 문서들엔 그 단어를
포함한 문서가 적을 수록 TFIDF 값이 높아지게 된다.
즉, 문서 내에서 해당 단어의 중요도는 커지게 된다.

![image-20210309142628963](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309142628963.png)





![image-20210309142640625](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210309142640625.png)

m2 에서 TFIDF = TF와 IDF를 곱한 것. 

어떤 문서가 첫번째에서만 등장하고, 나머지 에서는 등장하지 않으면, 그 등장했던 첫번째 에서 가중치가 크다는 것이다. 4군데 다 등장하면, 주제어로서의 가중치는 0이 된다.



##### ⑵ 스티브잡스 예제3

```R
// 조상이 누구이든 간에 p 태그만 찾는다. -> 연설문이 p태극 가 낭ㄴ다. 
v <- sort(rowSums(m), decreasing=T) # 모든 문서에서 단어가 몇번 나왔는지 체크
```

content_transformer 는 리턴값이 함수이다. 

stemDocument() :  어근을 남긴다.?







## 4) 문서간 유사도 분석

문서들 간에 동일한 단어 또는 비슷한 단어가 얼마나 공통으로 많이 사용 되었나에 따라서 ==문서간 유사도 분석==을 할 수 있다.

문서간의 유사도를 분석하기 위해서는 문서에 포함된 단어들을 단어별로 쪼갠 후에 단어별로 개수를 세어 행렬로 만들어주는 전처리가 수행되어 있어야 한다.

documentTermMatrix를 만들어서 수행을 해야 . 전치 행렬  * 행렬



### ● 유사도 분석의 step

1. 문서의 각 단어들을 수치화 하여 표현한다. – DTM
2. 문서간 단어들의 차이를 계산한다 – **코사인 유사도**, **유클리드 거리**



### (1) 코사인 유사도(Cosine Similarity)

두 벡터 간의 코사인 각도를 이용하여 유사도를 측정하고 문서 분류 군집화 등에 활용할 수 있다. 

코사인 유사도는 문서의 길이가 다른 상황에서 비교적 공정한 비교를 할 수 있도록 도와준다.

이는 코사인 유사도는 유사도를 구할 때, 벡터의 크기가 아니라 벡터의 방향(패턴)에 초점을 두기 때문인데,  코사인 유사도가 벡터의 유사도를 구하는 또 다른 방법인 내적과 가지는 차이점이라 할 수 있다.

![](https://wikidocs.net/images/page/24603/%EC%BD%94%EC%82%AC%EC%9D%B8%EC%9C%A0%EC%82%AC%EB%8F%84.PNG)

| 완전히 동일 | 반대 방향 | 90도 |
| :---------: | :-------: | :--: |
|      1      |    -1     |  0   |
```R
dist(com, method = "cosine")
```



#### :notebook_with_decorative_cover:`참고` 코사인거리와 코사인 유사도

`코사인 유사도(Cosine Similarity)`는 두 개의 문서별 단어별 개수를 세어놓은 특징 벡터 X, Y 에 대해서 두 벡터의 곱(X*Y)을 두 벡터의 L2 norm (즉, 유클리드 거리) 의 곱으로 나눈 값이다. 

 `코사인 거리(Cosine Distance)`는 1 - 코사인 유사도(Cosine Similarity) 이다. 





### (2) 유클리드 거리 유사도 (Euclidean Distance)

두 점 사이의 유클리드 거리 공식은 **피타고라스의 정리**를 통해 두 점 사이의 거리를 구하는 것과 동일하다.

```R
dist(com, method = "Euclidean")
```



 ```R
install.packages("proxy")
dd <- NULL
d1 <- c("aaa bbb ccc")
d2 <- c("aaa bbb ddd")
d3 <- c("aaa bbb ccc")
d4 <- c("xxx yyy zzz")
dd <- c(d1, d2, d3, d4)
cps <- Corpus(VectorSource(dd))
dtm <- DocumentTermMatrix(cps) # 행이 도큐먼트. 
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)
com <- m %*% t(m)
com
dist(com, method = "cosine")
dist(com, method = "Euclidean")
 ```





### (3) 유사도 분석의 결과 해석

유사도 분석의 결과를 해석하자면, 거리가 짧을수록(숫자가 작을수록) 두 문서간 유사도가 높다고 판단할 수 있다.





## 5) 워드클라우드

```R
wordcloud2(data = head(result_df,100),    # 데이터프레임
           fontFamily = '나눔고딕',        # 사용할 글꼴
           fontWeight = 'normal',         # 글꼴의 굵기 (normal or bold)
           size = 1.3,                    # 글꼴크기(기본값=1)
           minSize= 0.3,                  # 글꼴의 최소 크기
           backgroundColor = "#ffffff",   # 배경색상
           widgetsize = c(800, 600),      # 위젯의 크기 (가로,세로) 픽셀 형식의 벡터
           color=brewer.pal(11, "RdYlGn") # 색상 팔래트 적용 (단일 값인 경우 단색으로 지정됨)
          )
```