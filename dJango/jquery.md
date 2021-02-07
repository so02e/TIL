# 1. jQuery

자바스크립트를 간단하게 구현시켜 준다. 

API 사용방법이 일관성 있다.

익히기 쉬움.







HTML 문서 안의 스크립트 코드를 단순화하도록 설계된 자바스크립트 라이브러리.

<주요 기능>

DOM 요소 선택 기능, DOM 탐색 및 수정,

CSS선택자에 기반한 DOM 조작

크로스 브라우징 이벤트 처리

특수효과 및 애니메이션

```javascript
<script src = "http : //" </script>
```



## 1) jQuery객체로의 포장

jQuery이름을 $로 얼라이언스? 되어있다.



document 객체를 jQuery 객체로 만들고자 하면

$(document).xxxxx()

아규먼트가 css 선택자이면

$('CSS선택자')

dom 객체를 찾아와 jQuery 객체로 포장함



## 2) 주요 아규먼트

자바스크립트 객체

CSS 선택자 html 태그

돔객체

$(함수) : 로드 이벤트의 처리와 동일한 효과



### 3) 이벤트 핸들러 등록

ready 이벤트가 발생되면 





선택된 옵션 태그가 누구인지.

$('select > option : selected').val();

선택된 것의 벨류값이 경고창에 뜰 것이다.



input 태그나 select 태그에 입력된 값을 가져올 때 는 val() 메서드를 사용한다.



getter는 값을 꺼내는 용도



setter로 동작.



아규먼트가 있으면 setter 없음ㄴ getter로 동작

   0





setTimeout(fuction(함수), 시간 : 일정시간 후 이 함수를 실행한다.





select  : 선택

input : 입력





**html() = innerHTML : 돔객체를 얻어와서** 

**text() = textContent : 돔 객체를 얻**

**val() = value : form 태그의 서브 태그 .(주로 input 태그)**



**1) getter (값을 읽는다.)**

​	html() : 첫번째 

​	text() : 모두

​	value() : 첫번쨰

와 같이 아규먼트를 안넣을 수도 있고



each(인덱스, 실제 객체) : 모두 적용할 떄  알림창이 모두 나온다. 



```
   $(document).ready(function () {
            $('h1').each(function(index,data) {
        		var color = $(data).css('color');
        		 alert(color); 
        	}); 
        });
```



each 를 안쓰면 하나만 적용된다.

```
   $(document).ready(function () {
      
         	var color = $('h1').css('color');
        	alert(color);
        });
```







```
    <script>
        $(document).ready(function () {           
             var html = $('h1').html();          
            alert(html);
    
        });
    </script>
```



getter로 동작할 때는  html text를 쓰느냐의 차이는 dom 객체가 여러개일때

모든 컨텐츠를 하나로 엮어서 사용하려면 text를 사용해야 한다.



```
    <script>
        $(document).ready(function () {           
    
            $('h1').each(function(index, data){
            	var html = $(data).html();          
                alert(html);
            });  
        });
    </script>
```







**2) setter (값을 설정한다.)**

 	html("...."), t

​	html(함수)

​	html() 와 같이 쓸 수 있다.

--------------------------------------------------------------------------

**css()** : 태그의 스타일 속성

**attr()** : 태그의 고유 속성 



​	**1) getter(아규먼트를 하나만 주었는데, CSS 속성명을 준 경우)**

​	css("CSS 속성명")

​	attr("HTML 태그 속성명")

​	

 	**2) setter** **(값을 설정한다.)**

​	css("CSS 속성명", "CSS 속성값")

​	attr("HTML 태그 속성명", "HTML 태그 속성값")

​	

​	css("CSS 속성명", 함수)

​	attr("HTML 태그 속성명", 함수)

​	

​	css(자바스크립트 객체)

​	attr(자바스크립트 객체) -> 여러가지 속성을 한번에.



​	



------------------------------------------------------------------------------------

몇번째 h1 태그인지 체크해야 할 때 -> index

$('h1').html(function(index,oldcontent)){

}





# 2. 돔객체와 jQuery

html 태그마다 자바스크립트 객체가 만들어짐(돔)

돔객체를 가지고 변경하기



<addClass('클래스 속성의 값')>

모든 h1에 클래스 속성을 추가한다. 클래스 속성 = 아이템

```javascript
<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('h1').addClass('item'); // 클래스 속성.
        });
    </script>
    <style>
        .item {
            background-color : yellow;
        }
    </style>
</head>
<body>
    <h1>Header-0</h1>
    <h1 class="test">Header-1</h1>
    <h1>Header-2</h1>
</body>
</html>
```





<addClass('클래스 속성의 값')>

속성의 값에 함수를 줌.  index ?

```javascript
<!DOCTYPE html>
<html>
<head>
        <style>
        .class0 { // 클래스 0이 속성
            color : red;
        }
        .class1 { // 클래스 1이 속성
            color : green;
        }
        .class2 { // 클래스 2의 속성
            color : blue;
        }
    </style>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('h1').addClass(function (index) { //h1 태그에 클래스 속성 'function의 리턴값'
                return 'class' + index;
            });
        });
    </script>
</head>
<body>
    <h1>Header-0</h1>
    <h1>Header-1</h1>
    <h1>Header-2</h1>
</body>
</html>
```





지우는 거

```javascript
<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('h1').removeClass('select');
        });
    </script>
</head>
<body>
    <h1 class="item">Header-0</h1>
    <h1 class="item select">Header-1</h1>
    <h1 class="item">Header-2</h1>
</body>
</html>
```









attr



```
<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('img').attr('width', 200);
        });
    </script> 
</head>
<body>
    <img src="Chrysanthemum.jpg"/>
    <img src="Desert.jpg"/>
    <img src="Hydrangeas.jpg"/>
</body>
</html>
```



이벤트 핸들러 안에서의 this는 이벤트가 발생된 대상

data로 시작하는 것은 커스텀 속성.





$('CSS 선택자', **context**).xxxxx() : DOM 객체에서 찾는다. 

그 객체 자손에서 찾는다. (context)default는 전체에서 찾는 것. 

## 3. 이벤트

### 1. $('........').on('이벤트 이름', 함수)

### 	$('........').on(자바스크립트 객체, 함수)



### 	$('........').off 이벤트 핸들러를 해제





### 2. $('........').이벤트이름(함수)





hover와 mouseleave/ mouseenter

2개 이상 해도, 순서대로 