# 1. 웹 프로그래밍 (2)

## 1. 웹 클라이언트와 웹 서버

인터넷을 사용하는 컴퓨터들 사이에 왔다 갔다 할 때 요청하는 컴퓨터를 '클라이언트' 응답하는 컴퓨터를 '서버'라고 부른다.
클라이언트 프로그램인 '**브라우저**' 는 URL 을 파악하여 서버에 요청을 한다.


웹 클라이언트와 웹 서버가 서로의 역할을 통해 `웹 통신망`을 운영 가능하도록 함


www.daum.net : 다음 홈페이지에 들어가겠다. daum 의 웹서버는 국내에 있음
www.python.org : 외국에 있는 웹 서버


국내, 외국의 웹서버 관계없이 웹 서버마다 고유의 주소(IP 주소) 숫자 기억이 어려우니까 도메인 명을 쓰는 거고 우리가 아는 주소가 도메인 명이다. 

※ 쿼리 문자열
key = value 의 쿼리 문자열
네이버에서도 검색할 때 쿼리 문자열

```
https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=침착맨
```

```
https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EC%B9%A8%EC%B0%A9%EB%A7%A8
```

## 2. HTML 문법
### (1) 줄바꿈
#### ① `<br>`

줄바꿈이라는 **시각적인 의미**만 가지고 있을 뿐, **닫지 않는다**.

#### ② `<p>`

단락을 표현할 때 쓰는 태그



## 3. CSS 적용 방법
CSS 는 HTML 의 시각적 효과를 위해 사용된다.

### (1) 지역적 방법 (인라인)

h2 태그의 색을 다 바꾸고 싶을 떄

```
<h2 style = "color:pink">
```

일일히 적용하는 것은 너무 비효율적이다.



### (2) 전역적 방법

헤드 태그에다가 style 을 작성함 

```html
<head>
    <meta charset="UTF-8">
    <title>HTML 학습</title>
    <style>
        h3 {
        color:green;
    </style>
</head>
```



* 둘다 적용되어 있는 경우에는 **인라인의 우선순위가 높다.**




## 4. CSS 문법

### (1) `hover` : 마우스가 해당영역에 가까이 가면 해당하는 명령을 수행할 수 있다. 
→ 예: 마우스가 해당 이미지에 가까이 간 경우, 이미지를 투명하게 처리한다.

→ 예: 마우스가 해당 영역에 가까이 간 경우, 볼드체를 처리한다.


### (2) `margin` : 우리집과 다른 집 사이의 공간
| margin 을 상하좌우 **각각** 부여 | margin을 상하좌우 **함께** 부여                              |
| :------------------------------- | :----------------------------------------------------------- |
| margin-top                       | margin : 10px 20 px 30 px 40px (시계방향으로 위 /오 /아/ 좌) |
| margin-right                     | margin : 10px 20px 30 px (위 / 아래  /좌우)                  |
| margin-bottom                    | margin : 10 20(위아래 / 좌우)                                |
| margin-left                      | margin 10 (상하좌우)                                         |










### (3) 블럭(`div`)과 인라인(`span`)
div(블럭), span(인라인) 에 따라 스타일이 달라짐.
행단위 / 하나의 행에 이어져서 출력

#### (1) 블럭 DIV 와 인라인 span



#### (2) 스판태크

스판 아이엠지 인풋 : 인라인

태그의 공간이 달라지지만, 부여하는 사이즈, 태그 공간의 사이즈를 지정하는 방법도 조금씩 달라진다.



width height 조정을 못하는 인라인 

전체 중 일부만 다르게 스타일을 줄 때

```
<head>
<style>
	.top {
    	color : #cc0099;
    	}
</style>
</head>
```

top 이라는 클래스 속성을 갖는 친구들을 찾아서 색상을 바꾼다.

ID를 못 쓰는 이유는 ID는 유일해야 해서 한번 써야 한다.

 

```
<body>
	<h1>	<span class="top">블럭</span> 
			스타일 태그와 
			<span class="top">인라인</span> 
			스타일 태그
	</h1>
</body>
```





## (3) div 태그



```html
<head>
<style>
	 div {
            background-color : lime;
            margin : 5px;
            width : 300px;
            height : 200px;
            font-size : 1.5em;
            padding : 10px;
        }
</style>
</head>
```

width heigth 속성을 주어 마음대로 바꿀 수 있다. 

padding 은 우리집 앞마당 : 

마진은 우리집과 다른집  사이의 공간



* width height : 안에 있는 탁한 파란 박스

* padding  : 

  width + 2 * padding : 가로



```html
<body>
	<div>가나다라마바사아</div>
	<div>0123456789</div>
	<div>abcdefghij</div>
</body>
```







모바일 퍼스트







방이될 수 있는 블럭 !

출력 내용을 가운데에 몰겠어. 

```
div {
  
    text-align : center;
    margin-left : auto;
    margin-right : auto;
    border-radius : 30px;
    line-height : 200px;
    border : 1px solid red;
}
```

```
h1 {
    text-align : center;
    text-shadow : -2px -2px 5px green, -4px -4px 5px red;
}
```

그림자에서 주는 px

음 :우측 아래 / 양 : 좌측 위






## n번째 div이라 지정

```
	div:nth-of-type(1) {
		background-color : yellow;
		border : 2px solid red;
		border-radius : 30px;
	}
```

```
	div:nth-of-type(2) {
		background-color : lightgreen;
		border : 2px dotted magenta;
		border-radius : 20px 40px 60px 80px;
	}
```

```
	div:nth-of-type(3) {
		background-color : #000000;
		border : 5px dashed #ffffff;
	}
```





함수형식을 통해 그라데이션 효과 혹은 이미지의 계속 반복



클래스 속성.

div 태그 중 클래스 속성을 갖는 친구를 찾아서 이미지를 지정하나.

top-bottom : 



이미지를 한 행에 3개씩 출력하게 하는 법

1번<img> <img> <img> <br>



