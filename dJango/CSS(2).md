1. 가운데 정렬

text allign : center;

2. 일부 단어의 태그 

   span 태그를 주어 



height : 는 패딩까지 포함해서 100이 확장 되기 때문에... 



상하의 가운데로 글씨 "날씨의 종류"

1. padding top

```
h1{
    color : white;
    width : 350px;
    height : 100px;
   margin : auto;
   text-align : center;
   padding : 10px;
   background-image : linear-gradient(to right, red, orange, yellow, green, blue, navy, purple);
   border-radius : 20px;
   text-size : 10em;
   padding-top : 40;
}
```



2. line-height 

```
line-height : 100px;}
```

기본 height와 line-height의 높이를 같게 한다.

한 행의 길이를 100으로 하여.





정렬 



## 2. 테이블 

```css
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CSS 학습</title>
</head>
<body>
<h1>테이블 출력하기</h1>
<hr>
<table>
	<tr><th>이름</th><th>고향</th><th>나이</th></tr>  
	<tr><td>둘리</td><td>쌍문동쌍문동쌍문동쌍문동쌍문동</td><td>10</td></tr>  
	<tr><td>도우너</td><td>깐따비아</td><td>9</td></tr>  
	<tr><td>또치</td><td>아프리카</td><td>10</td></tr>  
</table>
</body>
</html>
```



tbody 를 무시하고 tr 태그만 써도 자동으로 tbody 가 추가되는 것을 확인할 수 있다. 



첫번째 tr - > th

두번째 tr

세 번째 tr -> 







```css
<style>
	table, th, td {
		border : 1px solid black;
		border-collapse : collapse;
	}
	th {
		background-color : lime;
	}
</style>
```



border-collapse : collapse;

 border를 붙여준다.











게시판

아래에만 선

```css
<html>
<head>
<meta charset="UTF-8">
<title>CSS 학습</title>
<style>
	td {
		border-bottom : 1px dotted black;
	}
	th {
		background-color : lime;
	}
	tr:hover {
		background-color : pink;
	}
	th:nth-of-type(1) {
		width : 100px;
	}
	th:nth-of-type(2) {
		width : 400px;
	}
</style>
</head>
<body>
<h1>테이블 출력하기</h1>
<hr>
<table>
	<tr><th>이름</th><th>고향</th><th>나이</th></tr>  
	<tr><td>둘리</td><td>쌍문동쌍문동쌍문동쌍문동쌍문동</td><td>10</td></tr>  
	<tr><td>도우너</td><td>깐따비아</td><td>9</td></tr>  
	<tr><td>또치</td><td>아프리카</td><td>10</td></tr>  
</table>
</body>
</html>

```



테이블의 셀의 크기는 가장 많은 컨텐츠를 갖고 있는 셀에 맞춰서 그려짐



가상선택자 : 







## 3. 레이아웃 나누기

웹 페이지 구성에 있어 출력을 어떤식으로 배치하는지에 따라 페이지의 느낌이 달라진다.





em 태그를 사용한 강조는 이탤릭 체

strong 태그는 굵게 



<br> 개행

<br/>

<br> 태그는 단일 태그로 닫는 꺽새 앞에 슬래시를 붙여도 된다.



블럭 스타일 태그의 경우에는 출력할 때 자동으로 행바꿈을 해준다.

인라인 스타일 태그는 쭉 이어서 출력하는 특성을 갖는다. 



## 3. 시멘틱 레이아웃



```
<div id = "header"> </div>
```

를

```
<header> </header>
```

width 가 짧아져도



## 4. float clear

블럭 스타일 태그는 화면에 보여지는 것을 그만큼의 width ~~를 의미하지 페이지 너비를 쭉 갖는다.

30 % 만 쓰는 것처럼 보이게 하지, 그 영역의 끝까지 공간을 갖는다.



블럭스타일은 위에서 부터 아래로 쭉 내려오는 걸로 ~



float 속성은 이를 해결할 수 있다.

띄워라 ! 태그 영역을 

float : 왼쪽에 ..! 남은 공간을 



clear both ;

밑으로 들어가기 때문에 안보이는 결과를 방지

앞에 설정된 float와 관련된 설정을 여기서는 해제 한다...... 공간의 분리?로 자기만의 공간을 새롭게 만들게 됨



## 5. link 

href : 끌어오고자 하는 url, 이름

rel : 관계, (stylesheet) 관계는 스타일을 적용하는 문서이다.



공동으로 필요한 경우 링크태그를 쓰는게 나은 방법이 되지만,

개발할 때 css파일을 수정했다 하더라도 html 이 수정하지 않ㄴ는 이상 ... 적용이 안되는 경우.



개발 단계에서는 link 보다는 





## 자식 div(1)

자식 1 : h3

자식 2 : p , p태그 중에서는 첫번째 

자식 3 : p

```
<div>
<h3>어린 왕자</h3>
<p>1장 </p>
<p>2장
    
</div>
```



```
  <style>
        p:nth-child(2) { -> 자식 2
            color : red;
        }
        p:nth-of-type(2) { -> 자식 3
            color : blue;
        }
```





### 섹션





```
<section>
    <h1>섹션제목</h1>
    <article>
        <h1>아티클제목</h1>
    </article>
</section>
```





아아





```
     section > h1 {
            color : green;
        }
       section h1 {
            background-color : pink;
        }
```

