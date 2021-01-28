# 1. 자바스크립트

> 웹페이지에 동적인 처리를 구현하는 프로그래밍 언어.
>
> HTML 파일안에 구현하는 프로그래밍 언어로 `인터프리터 언어`이다.

`<script>`태그의 컨텐츠로 작성하거나, `HTML 태그에 정의된 속성`의 값으로 작성할 수 있다.



`CSS` 는 스타일을 보좌하고, `자바스크립트`는 연산, 액션을 보좌한다.

서버로부터 전송된 내용을 웹페이지로 볼 수 있는 것은 화면에 렌더링이 되는 것이라고 표현할 수 있는데,

자바스크립트에서는 태그를 하나하나 **객체(dom)** 으로 만든다.



* 동적 처리의 예시 - "버튼 태그"

#### 예시 : 버튼 생성

```html
<body>
    
<button>클릭하세요</button>
<button><img src ="../images/kakao/g7.png" width = "100"></button>    

</body>
```



```html
<script>
    var doms = document.getElementsByTagName("button");
    console.log(doms[0])
    console.log(doms[1])
    doms[0].onclick = function() {
        window.alert("텍스트 버튼이 클릭되었습니다");
    };
    doms[1].onclick = function() {
        window.alert("이미지 버튼 클릭되었습니다");
    };
</script>
</body>
```

doms 변수에 우리가 만든 button 을 담는다.



#### 예시 : 버튼의 동작 `function` 예약어

```javascript
   doms[0].onclick = function() {
        window.alert("텍스트 버튼이 클릭되었습니다");
    };
```

doms[0] (첫번째 버튼) 에 클릭이 일어나면, 경고창이 뜨게 된다. 





**즉, 자바스크립트는 사용자가 액션을 발생시켰을 때 그에 알맞은 기능이 수행되도록 기능할 수 있도록 만든다.**







#### API (Application Programming Interface)

프로그래밍할 때 자주 구현되는 기능을 미리 구현해 놓은 프로그램

프로그래밍 언어마다 자기만의 API를 갖고 있다.

개발환경 구축시 함께 설치되는 표준 API 와 사용자가 추가적으로 설치할 수 있는 확장 API(third party) 가 있다.





### 1) 변수 정의 방법과 처리 가능한 데이터 타입

#### (1) 자바스크립트 삽입 및 출력 (`document.write()`)

```html
<script>
    document.write(1+1);
</script>
```

→ HTML에서 작성하는 것과의 큰 차이가 없어보일수도 있지만,

동적언어이기 때문에 계산기처럼 작동이 가능하여 '2'가 출력된 결과를 확인할 수 있다.



* `값이 없다`의 2가지 의미
  - null 
  - undefined



`	pre` 태그로 감싸서 출력한다면, 개행하여 출력하도록 하고, 글씨 크기가 작아지게 된다.



### 2) 연산자와 제어문




#### (1) 연산자
다른 타입을 비교할 때, 자동으로 타입을 맞춰서 처리한다.**(숫자를 문자로 바꿔서)**

`===` : 동치 연산자 - **타입**을 먼저 비교하고, **값**을 비교함




#### (2) 단축 논리 연산

`&&` : and -> 참이여야 수행

`||` : or -> 앞에가 거짓이면 뒤에를 마저 수행한다.

`+` 연산을 제외하고 나머지는 알아서 숫자연산이 가능하다.



#### (3) 메서드

`window.alert()` : 사용자에게 메세지를 보여주고 확인받는 용도

`window.prompt()` : 사용자로부터 데이터를 입력받는 용도

`window.confirm()` : Yes 또는 No 의 양자택일을 입력받는 용도



#### (4) 제어문

* 조건제어문 : if , switch
* 반복제어문 : for, while, do-while
* 분기제어문 : break, continue

##### ① 조건제어문

###### ⓐ `If`

```javascript
if (조건식){
	수행문장;
	수행문장;
}
```

```javascript
if (조건식) {
	수행문장;
}
else if(조건식) {
	수행문장;
}
else {
	수행문장;
}
```



##### ② 반복제어문

###### ⓐ `for`

자바스크립트는 일반(전통)의 for 와 향상된 for의 형식을 모두 지원한다.

**<일반(전통)의 for>**

```javascript
for (초기식 ; 조건식 ; 증감식)
	반복수행문장;
```

|        초기식        |               조건식                |          증감식           |
| :------------------: | :---------------------------------: | :-----------------------: |
| 변수 정의와 초기화식 | 반복처리를 계속할지 결정하는 조건식 | 변수의 값을 변화시키는 식 |



**<for in 반복문>**

배열이나 객체를 가지고 반복을 처리함. 

인덱스(키)를 저장할 변수를 정의한다.

```javascript
for (변수 정의 in 배열 / 객체)
	반복수행문장;
```



###### ⓑ `while`

```javascript
while (조건식)
	반복문장;
```



**<무한루프>**

```javascript
while (true)
	무한으로 반복할 문장;
```





##### ③ 분기제어문

`break` : 반복문의 종료

`continue` : 다음 반복으로 계속해서 진행 



###### 난수 추출 및 1~10 까지의 합 출력

```javascript
/*
    1부터 10사이의 난수를 추출하여 (Math.random() - 0 초과 1 미만의 소수 적당하게 변환을 추가로 해줘야 함/
                                    Math.floor()  - 소수점 이하를 날려버리는 역할.)
    1~3 의 값이 추출되면 메시지를 <h2> 태그로 출력 (document.write();
    4~6 의 값이 추출되면 메시지를 <h3> 태그로 출력
    7~9 의 값이 추출되면 메시지를 <h4> 태그로 출력
    10 이 추출되면 메시지를 1부터 10까지의 합을 구해서 <h1>태그로 출력
*/
```

1부터 난수를 추출하기 위해서. 

```javascript
var num = Math.floor(Math.random() * 10) + 1
```



```javascript
var num = Math.floor(Math.random() * 10) + 1
document.write("<button> 추출된 값 : " + num + "</button>");
```

```
var result = 0;
    for (var n=0 ; n < 11 ; n ++)
   result = result + n;
   document.write("<h1> 1부터 10까지의 합 : " + result + "</h1>");
}
```



### 3) 배열(array) - "파이썬의 리스트(list)와 유사"

여러 데이터들을 하나의 묶음으로 다루고자 할 때에 사용한다.

묶을 수 있는 데이터의 개수에 제한이 없고, 데이터의 타입도 제한이 없다.

**자바스크립트의 배열도 객체로 취급된다.**

* 첫번째 데이터는 숫자, 두번째 데이터는 문자 넣어도 가능



#### (1) 배열 생성 방법

##### ① 배열 리터럴 방법

[1, 2, 3, 4, 5]

['aaa', 100, true, 3.4, 

[ ] : 비어있는 배열

[ ,,,,,,,, ] : 8개의 undefiended 값.



##### ② API 의 이용 `Array()`

new Array(1,2,3,4,5)

new Array('aaa', 100, true, 3.4)

new Array() : 비어있는 배열

new Array(,,,,,,,,) :  : 8개의 element 이지만 undefined

new Array(8) : 8개의 element 이지만 undefined



#### (2) 배열 사용 방법

##### ① 배열의 크기 

배열을 구성하는 element의 개수

배열 객체의 `length` 라는 속성(변수) 의 값을 사용한다.



##### ② 배열의 요소

배열의 요소(원소, element) 에 접근하는 방법 ("인덱스" : 0부터 시작하는 값 ) 을 이용한다.

l-value, r-value 모두 가능하다.



`typeof(대상)` : 대상의 타입을 출력함 -> 배열인지는 알 수 없다.

`Array.isArray(대상)` : 배열인지 확인

<속성>

`배열객체.length` : 배열이 몇 개의 element를 갖고 있는지 알려주는 속성



<메서드>

`배열객체.toString()` : 배열의 원소를 나열해준다. (자동으로 호출되는 것이라 생략해도 된다)

`배열객체.sort()` : 배열의 원소값을 문자로 간주하고 정렬을 한다. 

첫번째 자리수를 가지고 1차적인 정렬을 하게 된다. ex : 11 27 30 5 9



**오름차순**

```
sort(function(a, b){ return a-b;})
```

**내림차순**

```
sort(function(a, b){ return b-a;})
```



비어있는 배열을 만들고 뒤에 추가해주는 append와 비슷한 `push`



var d = new DateO



###### ⓐ 특이한 성질

if ,, 비어있는 배열 al에 al[4] = 100; 을 대입한다.

-> 5번째 element에 100이 들어가고, 1~4번째는 undefined 값이 생성된다.



###### ⓑ 배열의 요소에 접근하기

a = [10,20,30,40,50]

파이썬에서는

```python
for data in a :
	print(data)
```

수행시 ; 10 20 30 40 50 을 행 단위로 얻을 수 있었다.



자바스크립트에서

```javascript
for (var i in a)
	window.alert(i)
```

0,1,2,3,4 의 인덱스를 주는 것으로 인식한다.



10 20 30 40 50 을 행 단위로 얻기 위해서는

```javascript
for (var in a)
	window.alert(a[i])
```

의 코드를 짜야 한다.



**undefined 는 무시한다.** 는 특성을 가진 자바스크립트





### 4) 함수

함수는 일급 객체로 취급된다. 함수를 변수에 담아서 사용할 수 있다.

함수 호출 시 아규먼트로 전달이 가능하고, 리턴값을 함수를 전달 가능

함수를 호출할 때 함수에 정의된 매개변수만큼 아규먼트를 전달하지 않아도 호출가능하다.

가변인수를 지원한다. 함수 호출시 아규먼트의 갯수에 제한이 없는 함수를 만들 수 있다.

-> 가변인수 함수를 정의할 때는 매개변수 정의를 생략하고.. ~~

기본값을 갖는 매개변수를 정의할 수 있다.





2가지 방법 중 편한 방법으로 쓰면 되는 것이다. 

#### (1) 함수 정의 방법 (예약어 `function`)

전역변수와 선언적 함수정의를 가장 먼저 한다.  방을 먼저 만들어 놓는다.

f1에 방은 만들었는데 어떤 값을난 들어가야하는지는 몰라



선언적 함수정의를 가장 먼저 찾는다. 그 이후 첫 행. 

```javascript
function 함수명 ([매개변수 ...]) {
	함수의 수행코드
    return 리턴값;
}
```



표현식 함수 정의

```javascript
변수 = function ([매개변수 ...]) {
	함수의 수행코드
    return 리턴값;
}
```



선언적 함수정의의 경우에는



#### (2) 함수의 사용 (호출)

웹페이지에서의 이벤트 (키보드, 클릭 "액션") 발생 시 경고창이 나온다거나,등의 기능은 

이벤트 핸들러를 구현할 때 함수를 사용한다.



console.log () : 개발자들을 위해서 사용한다. 



#### (3) 함수

function **sum**() {

}



아규먼트로 함수를 쓰고 싶을 떄

함수명(**sum**);



****

var **age** = function() {

}

함수명(**avg**)



고차함수 :

함수명(**sum()**){

} 는 sum으로 리턴된 결과가 들어오게 된다.



시간 . window 의 인터벌(?) 기능이 있고, 필요할 때 구글링 할 것.



자바스크립트 코드 추가의 방법

1) 스크립트 태그를 사용하고, 그 안에 컨텐트를 채워넣는 방법

```javascript
<script>
	내용;
</script>
```



2) 자바스크립트 코드를 독립적으로 만들어서 끌어오게 만드는 방법. (공통되는 경우가 있는 경우)

```javascript
<script src = "util.js"></script>

```


#### (4) 자바스크립트의 변수정의

v2는 전역변수까지도 된다...!

```javascript
v1 = 10;
function f1(){
	v2 = 20;
}
```



`var`를 붙여서 **지역변수, 전역변수** 구분이 된다. 

```javascript
var v1 = 10;
function f1(){
	var v2 = 20;
}
```

자바스크립트 사용에 있어 항상 **var**를 붙인다고 생각하자. 



`let` 를 붙여서 똑같은 변수가 두번 이상 선언되는 것을 방지할 수 있다.

이미 v1 이 선언되었는데, 또 v1을 선언할 수 있는 경우 방지해주는 **let**

다시 값을 바꾸는 경우는 괜찮음.



`const` 를 붙여서 그 변수를 상수를 사용한다. 한번 할당한 값을 바꿀 수 없다.







### 5) 객체 생성

#### (1) 객체 생성 방법

##### ① 객체 리터럴 방법

배열 객체를 만들 때 리터럴 방법은 : [1, 'abc', true] 와 같이 값을 나열하는 것이었다.

그냥 `객체`를 만들 때는 {속성명 : 속성값, 속성명, 속성값, ...}

​		`속성명` : 자바스크립트의 식별자 규칙(명명 규칙)

​		`속성값` : 숫자, 문자열, 논리값, 배열, 객체, 함수 (메서드)



obj = {속성명 1 : 100, 속성명 2 : "둘리", 속성명 3 : function(){...}}

obj.속성명 1 = 200

obj.속성명2  + "승리"

obj.속성명3()





for 반복문을 쓸 수 있다. 속성값을 바꿀 때 



##### ② 클래스(생성자 함수)의 이용 

New Array(), New Date()



##### ③ 내장객체

개발자가 객체를 생성하지 않아도 자바스크립트 엔진이 자동으로 생성해주는 객체

window, document, navigator, screen, `DOM객체`







### 6) 이벤트 처리 : DOM 객체를 통한 HTML 태그 제어 

#### (1) DOM (Document Object Model) 프로그래밍

웹페이지를 만들 때 자바스크립트 는 표준이라고 할 수 있다. 

DOM 객체 . 브라우저가 웹페이지를 해석하고 랜더링할 때 인식된 태그들을 자바스크립트 객체로 생성하며 이 객체들을 DOM 객체라고 한다. 

생성되는 DOM 객체들은 **부모 자식 관계를 적용하여 트리구조로** 구성한다. 





태그만 돔 객체가 되는 것이 아니라, 텍스트 내용, 속성도 돔 객체가 되어 계층 구조를 갖게 된다.



```javascript
<body>
	<h1> ... </h1>
	<ol>
		<li> ... </li>
		<li> ... </li>
	</ol>
</body>
```



​											document	

​											    body

​							        h1	                    ol

​		                             li                          li



#### (2) DOM 객체를 찾는 방법

동적인 처리를 하려는 태그의 DOM 객체를 찾는 방법

ex ) 요일에 따라 인사말을 바꾸고 싶은 경우

`document.getElementsByTagName("태그명")` : DOM 객체 배열

`document.getElementByID("id 속성값")`: DOM 객체

`document.getElementByClassName("class 속성값")` : DOM 객체 배열



`document.querySelectorAll("CSS선택자")` : DOM 객체배열

`document.querySelector("CSS 선택자")` : DOM 객체



DOM 객체 타입 : Element 타입, Attribute 타입, Text 타입



#### (3) 찾은 DOM 객체에서 동적처리의 구현

##### ① 컨텐츠 변경 및 읽어옴

**dom.innerHTML =** "<p> 새로운 내용</p>"

**dom.textContent =** "새로운 내용"



##### ② 스타일 변경

**dom.style**.CSS속성명 = CSS속성값



|    -기호가 없는 경우    |                    - 기호가 있는 경우                    |
| :---------------------: | :------------------------------------------------------: |
|      그대로 한다.       | 앞의 부분은 그대로 - 기호 뒤의 아이는 대문자 뒤로 바꿔서 |
| dom.style.color = "red" |        dom.styple.background**C**olor = "yellow"         |



##### ③ 이벤트 핸들러 등록

###### ⓐ 인라인 이벤트 모델 (지역적 방식)

태그마다 속성으로 정의

`<태그명 on이벤트명 = "이벤트핸들러코드">`



###### ⓑ 고전 이벤트 모델 (전역적 방식)

DOM 객체를 먼저 찾고, 찾아온 DOM 객체를 dom 에 담았다고 가정한다.

`<script>` 태그 안에, `dom.on이벤트명 = function() { .....................} `



###### ⓒ 표준 이벤트 모델 (전역적 방식)

DOM 객체를 먼저 찾고, 찾아온 DOM 객체를 dom에 담았다고 가정한다.

`<script>` 안에 `dom.addEventListener("이벤트명",function(){...................})`









### 7) JQuery : 자바스크립트의 대표적인 API

간단한 자바스크립트 구현을 지원한다.


