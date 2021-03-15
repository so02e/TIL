# 1. R과 ggplot 패키지를 이용한 데이터 시각화

==ggplot2==는 그래프 기능을 제공하는 유용한 패키지이다. Hadley Wickham 교수에 의해 2005년부터 개발되고 있으며 ‘Grammar of Graphics’의 개념을 적용하여 기본 R 그래픽에서 제공하는 대부분의 작업을 효과적으로 수행한다. 보통 하나의 `ggplot()`함수와 여러개의 `geom_xx()`함수들이 `+`로 연결되어 하나의 그래프를 완성한다. 

## 1) ggplot2 란?

### (1) ggplot2의 장점

* 동일한 문법으로 다양한 그래프를 그릴 수 있다.
* 비교적 쉽게 높은 수준의 그래프를 그릴 수 있다.
* 데이터를 다루고 이해하는데 좋다.

### (2) Plot의 구성요소

* A set of layers
* A set of scales
* A coordinate system
* A facetting specification

### (3) ggplot2의 Grammar of Graphics

ggplot2는 ‘Grammar of Graphics’ 을 적용하여 다음과 같은 다섯가지 사항으로 그림을 그린다.
#### ① **Data**
그래프를 그리려는 데이터로 구조는 데이터 프레임이고 데이터의 기록 방식은 long-farmat에 기반한 tidy data여야 한다.

#### ② **(Aesthetic)Mapping**
데이터의 요소와 그래프의 요소를 대응시키는 과정으로 그리려고 하는 그래프가 필수적으로 요구하는 대응요소만 만족시키면 된다. 하나의 변수가 여러 가지 시각적 요소에 대응될 수도 있다.
#### ③ **Geometric Object**
어떤 형태의 그래프를 그릴지 지정해야 한다. ggplot2에서는 이것을 Geometric Object, 줄여서 geom이라고 한다.
#### ④ **Position**
그래프의 형태를 지정했으면 그래프에서 각 도형이 어떤 식으로 배치될 지를 결정할 수 있다. 이 옵션이 바로 position이다. 막대그래프나 선 그래프라면 누적 그래프를 그리거나 할 때 position 옵션을 조정해서 형태를 바꿀 수 있다.
#### ⑤ **Statistical Transformation**
마지막으로 값이 어떻게 그래프에 반영되는지 결정하는 옵션이 있다. Statistical Transformation, 줄여서 stat 옵션이다. 히스토그램과 같이 구간내에 존재하는 값의 개수를 세거나 밀도를 계산하는 등, 주어진 값을 변형시켜서 그래프에 반영시킬 때 사용한다.



## 2) 그래프 그리는 과정

### (1) ggplot() : 데이터와 축 지정

`ggplot()` 는 시각화할 데이터와 축을 지정하는 역할을 한다. <br/>`data` 매개변수는 시각화할 데이터를 지정하고, `aes` 매개변수는 x축과 y축을 설정하는데 쓰인다. 

```R
# x축 displ, y축 hwy로 지정해 배경 생성
ggplot(data = mpg,
       aes(x = displ, y = hwy))
```

### (2) geom_xx() : 그래프의 작성

#### ① 산점도, 산포도 - geom_point()

```R
# 배경에 산점도 추가
ggplot(mpg,aes(displ, hwy)) + geom_point()
ggplot(mpg) + geom_point(aes(displ, hwy))
```

![image-20210313173021043](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210313173021043.png)

#### ② 선 그래프 - geom_line()

```R
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_line()
```

![image-20210313173041259](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210313173041259.png)

#### ③ 상자 그래프, 박스 플롯 - geom_boxplot()

```R
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
```

#### ④ 히스토그램 - geom_histogram()

#### ⑤ 막대 그래프 - geom_col(), geom_bar()

##### ⑴ 집계 막대 그래프 - 미리 집계해서 줘야함

`geom_col()`은 미리 계산을 해서 주어야 한다. 

```R
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
```

##### ⑵ 빈도 막대 그래프

`geom_bar()`는 알아서 개수를 세고 그려주기 떄문에 x축에 대한 정보만 주면 된다. 

```R
ggplot(data = mpg, aes(x = drv)) + geom_bar()
```

### (3) 축   

#### ① coord_cartesian()

ggplot2에서는 여러가지 좌표계를 지원하는데, 일반적으로 사용하는 데카르트 좌표계는 `coord_cartesian()` 함수를 통해 설정할 수 있다. 이 함수는 x축과 y축의 범위를 지정해주는 함수로, xlim과 ylim 내부에 최소값, 최대값의 범위를 지정해주면, **해당 범위의 데이터만을 보여준다.** 

```R
# x축 범위 3~6, y축 범위 10~30으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
geom_point() + 
coord_cartesian(xlim=c(3, 6), ylim=c(10, 30))

```

![image-20210313174827029](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210313174827029.png)

#### ② scale_x_continuous() / xlim()

축 눈금 값을 설정해야하는 경우 `scale_x_continuous()`혹은 `scale_y_continous()` 함수를 사용한다.

- `xlim( , ) + ylim( , )`
- `scale_x_continuous(limits=c( , )) + scale_y_continuous(limits=c( , ))`

```R
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + scale_x_continuous(breaks = c(2,4,6)) + scale_y_continuous(breaks = c(15,20,25,30,35,40))
```

![image-20210313180115320](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210313180115320.png)



### (4) 컬러와 점 모양 추가

```R
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(shape=21, size=6, colour="blue") + xlim(3, 6) + ylim(10, 30)
```

### (5) Drv 변수별로 칼라 설정

```R
ggplot(data = mpg, aes(x = displ, y = hwy, col=drv)) + geom_point()
```



## 3) 인터렉티브 그래프

```R
install.packages("plotly")
library(plotly)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()
ggplotly(p)
p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
geom_bar(position = "dodge")
ggplotly(p)
```





# 2. treemap() 패키지를 이용한 데이터 시각화

## 1) treemap() 패키지



## 2) 이용

