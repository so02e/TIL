# 1. R 시각화와 그래프




## 1) 시각화 함수의 종류

하나의 그래프에는 고수준 함수를 하나만 사용할 수 있다. 여러 개의 그래프를 사요ㅇ하려면, 레이아웃을 이용해야하고, 저수준함수는 고수준함수의 그래프를 꾸며주는 역할을 한다. 

>* 고수준 함수 – plot(), boxplot(), hist(), pie(), barplot()
>* 저수준 함수 – title(), lines(), axis(), legend(), points(), text()
>* 칼라팔레트 함수 – rainbow(), cm.colors(), topo.colors(), terrian.colors(), heat.colors()

pch

<img src="C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085419141.png" alt="image-20210310085419141" style="zoom:50%;" />



Ity

<img src="C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085431248.png" alt="image-20210310085431248" style="zoom: 67%;" />



## 2) 산포도(산포도)

`산포도`는 다중변수 데이터에서 두 변수에 포함된 값들을 2차원 그래프 상에서 점으로 표현하여 분포를 관찰할 수 있는 도구

(기본 p)

```R
국어<- c(4,7,6,8,5,5,9,10,4,10)
plot(국어)
```

![image-20210310085506258](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085506258.png)



## 3) 시계열 그래프, 선 그래프

![image-20210310085535145](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085535145.png)





```R
plot(국어, type="o", col="blue")
title(main="성적그래프", col.main="red", font.main=4)
```

![image-20210310085509869](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085509869.png)







고수준 함수 / 저수준 함수 : 저수준 함수는 조연이다.  -> ==line==, ==title==

```
plot()
lines()
```

```R
수학 <- c(7,4,7,3,8,10,4,10,5,7)
plot(국어, type="o", col="blue")
lines(수학, type="o", pch=16, lty=2, col="red")
title(main="성적그래프", col.main="red", font.main=4)
```

![image-20210310085514042](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085514042.png)





```R
par(mar=c(1,1,1,1), mfrow=c(4,2)) # 마진을 1로 주고, 8개의 그래프를 그리겠다. 
plot(국어, type="p", col="blue", main="type = p", xaxt="n", yaxt="n")
plot(국어, type="l", col="blue", main="type = l", xaxt="n", yaxt="n")
plot(국어, type="b", col="blue", main="type = b", xaxt="n", yaxt="n")
plot(국어, type="c", col="blue", main="type = c", xaxt="n", yaxt="n")
plot(국어, type="o", col="blue", main="type = o", xaxt="n", yaxt="n")
plot(국어, type="h", col="blue", main="type = h", xaxt="n", yaxt="n")
plot(국어, type="s", col="blue", main="type = s", xaxt="n", yaxt="n")
plot(국어, type="S", col="blue", main="type = S", xaxt="n", yaxt="n")
```







```R
par(mar=c(5,5,5,5), mfrow=c(1,1))
plot(국어, type="o", col="blue", ylim=c(0,12), axes=F, ann=F)
```



![image-20210310085556203](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085556203.png)



```R
axis(1, at=1:10, lab=c("01","02","03","04", "05","06","07","08","09","10")) # x축 추가
axis(2, at=c(0,2,4,6,8,10)) # y축 추가
```

![image-20210310085612083](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085612083.png)





```R
lines(수학, type="o", pch=16, lty=2, col="red")
box()
```

![image-20210310085643291](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085643291.png)







```R
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(0,1,0))
title(ylab="점수", col.lab=rgb(1,0,0))
legend(1, 10, c("국어","수학"), cex=0.8, col=c("blue","red"), pch=c(16,21), lty=c(1,2)) # legend의 위치를 수치 데이터로 줄 수 있다. 1과 10에 맞춰져 그려지는 효과. 
```

![image-20210310085647108](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085647108.png)







```R
(성적 <- read.table("성적.txt", header=TRUE));
plot(성적$학번, 성적$국어, main="성적그래프", xlab="학번", ylab="점수", xlim=c(0, 11), ylim=c(0, 11))
#이미지 파일로 출력
ymax <- max(성적$국어) #성적 데이터 중에서 최대값을 찾는다(y 축의 크기 제한)
pcols<- c("red","blue","green")


# 그래프를 이미지 파일로 저장하는 코드
png(filename="성적.png", height=400, width=700, bg="white") # 출력을 png파일로 설정
plot(성적$국어, type="o", col=pcols[1], ylim=c(0, ymax), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("01","02","03","04","05","06","07","08","09","10"))
axis(2, at=0:5, lab=c(0,2,4,6,8,10))
box()
lines(성적$수학, type="o", pch=16, lty=2, col=pcols[2])
lines(성적$영어, type="o", pch=23, lty=3, col=pcols[3] )
title(main="성적그래프", col.main="red", font.main=4)
title(xlab="학번", col.lab=rgb(1,0,0))
title(ylab="점수", col.lab=rgb(0,0,1))
legend(1, ymax, names(성적)[-1], cex=0.8, col=pcols, pch=c(21,16,23), lty=c(1,2,3))
dev.off() #출력 종료
```





## 3) 바(막대) 그래프

주로 범주형 데이터에서 개수를 세어 표현하는 그래프이다. `table()` named vector 형식의 테이블 객체가 만들어진다. `table()` 을 통해 만든 테이블 객체를 통해 막대 그래프를 만들 수 있다. ==barplot ( 데이터, main = '제목' )== 의 형식을 통해 만들 수 있다.

```R
barplot(
			데이터,
         main = '제목',
         xlab = 'x축 이름',
         ylab = 'y축 이름',
         border = "red",
         col = 'green', # 막대그래프의 색 , c() 를 통해 각각 색을 지정할 수도, 팔레트를 사용할수도 있음
    		horiz = FALSE, # 수평 방향 출력 
         density = coldens,
         names.arg = xname
)
```



`las`는 x축의 그룹 이름을 수직 방향으로 출력하는 방법이다. 수평, 수직 만 가능하고 ggplot2를 통해 다른 각도로 출력할 수 있다.





```R
barplot(국어)
coldens <- seq(from=10, to=100, by=10) # 막대그래프의 색밀도 설정을 위한 벡터
xname <- 성적$학번 # X 축 값 설정위한 벡터
barplot(성적$국어, main="성적그래프", xlab="학번", ylab="점수", border="red", col="green", density=coldens, names.arg=xname)
```



![image-20210310085727027](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085727027.png)





```R
성적1<- 성적[3:5]
barplot(as.matrix(성적1), main="성적그래프", ylab="점수",
beside=TRUE, col=rainbow(10))
```

![image-20210310085746269](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085746269.png)

```R
xname <- 성적$학번; # x축 레이블용 벡터
barplot(t(성적1), main="성적그래프", ylab="점수", col=rainbow(3),
space=0.1, cex.axis=0.8, names.arg=xname, cex=0.8)
legend(0,28, names(성적1), cex=0.8, fill=rainbow(3));
```

cex는 출력되는 크기를 지정하는 역할을 한다. (기본사이즈 : 1)

![image-20210310085807665](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085807665.png)





```R
barplot(t(성적1), main="성적그래프",
ylab="학번", col=rainbow(3),
space=0.1, cex.axis=0.8, names.arg=xname,
cex=0.8, horiz=T)
legend(22, 4, names(성적1), cex=0.8,
fill=rainbow(3));
```

![image-20210310085819491](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085819491.png)







## 4) 히스토그램

히스토그램은 막대들이 붙어있다는 특징을 가지고 있다. 수치형 데이터의 값의 분포를 확인하는데 사용한다. 

```R
hist(성적$수학, main="성적분포-수학", xlab="점수", col = "lightblue",
border = "pink")
```





```R
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수",
breaks=6, col=rainbow(12), border = "pink")
```





```R
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수",
breaks=3, col=rainbow(12), border = "pink")
```



```R
hist(성적$국어, main="성적분포-국어", xlab="점수", ylab="도수",
breaks=6, col=rainbow(12), border = "pink", prob=T)
```



```R
lines(density(성적$국어, bw=0.5), col="blue", lwd=3)
```







```R
nums <- sample(1:100, 30)
hist(nums)
```





```R
hist(nums, breaks=c(0,33,66,100))
```



## 5) 파이 그래프

반시계 방향으로 그리고, 시작위치는 3시 방향 (기본적)

시계방향, anitclockwise -> 시작위치 12시

plotrix -> pie 3D의 함수를 통해 3차원의 형태로 



```R
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10))
pie(성적$국어, labels=paste(성적$성명, "-", 성적$국어), col=rainbow(10), main="국어성적", edges=10)
pie(성적$국어, labels=paste(성적$성명,"\n","(",성적$국어,")"), col=rainbow(10))
```



## 6) 박스 그래프 (상자 그림)

사분위수를 시각화하여 그래프 형태로 나타낸 것으로, 하나의 그래프로 데이터의 분포 등 다양한 정보를 전달하여 단일변수 수치형 자료를 파악하는데 자주 사용한다.

![](https://lh3.googleusercontent.com/proxy/JeLkID_jbXDT6CGl0kwlI9xHmwXS0my9SrwldbwVLFlePR-jb_76gUbYuCmZLeOF8dUZ_P6GcZlyzFIL6PZdkp20L86rzuBvGMHMJxmiuB0sMU9GvFAjm5TgidprlpMQrPo1XvLmFgvMB67GTkBXE2F-UaPFodU)

iqr ? 

이상치의 범위





```R
summary(성적$국어)
boxplot(성적$국어, col="yellow", ylim=c(0,10), xlab="국어",
ylab="성적")
```





```R
성적2 <- 성적[3:5]
boxplot(성적2, col=rainbow(3), ylim=c(0,10), ylab="성적")
```





```R
data <- read.table("온도.txt", header=TRUE, sep=",") # 아니면 read.csv 
head(data, n=5);
boxplot(data)
boxplot(data, las = 2)
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14))
chtcols = rep(c("red","sienna","palevioletred1","royalblue2"), times=3);
boxplot(data, las = 2, at = c(1,2,3,4, 6,7,8,9, 11,12,13,14), col=chtcols)
grid(col="gray", lty=2, lwd=1)
```



## 7) 이상치 판단

IQR = Q3 - Q1 → 사분 범위
Q1(=1분위수)-1.5×IQR 보다 작거나
Q3(=3분위수)+1.5×IQR 보다 큰 관측 값들을 이상치라고 한다.

![image-20210310085949267](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310085949267.png)

## 8) 저장

### ① [그래프를 파일에 저장하는 방법1]


```R
png("mytest.png", 500, 400)
# 그래프를 그린다.
dev.off() # 출력 종료 
```



### ② [그래프를 파일에 저장하는 방법 2]


```R
# 그래프를 그린다.
dev.copy(png,"mytest.png") # 또는  dev.copy(pdf, “mytest.pdf”)
dev.off()
```



## 9) 빌트인 칼라 팔레트

R이 디폴트로 내장(grDevices)하고 있는 칼라 파렛트 함수는 다음과 같다.
rainbow()
heat.colors()
terrain.colors()
topo.colors()
cm.colors()
gray.colors()

![image-20210310090020684](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310090020684.png)





## 10) RColorVrewer 칼라 팔레트



![image-20210310090025425](C:\Users\user\AppData\Roaming\Typora\typora-user-images\image-20210310090025425.png)