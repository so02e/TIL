library(dplyr)
library(stringr)
library(ggplot2)
library(treemap)
library(showtext)
showtext_auto() 
font_add(family = "cat", regular = "fonts/HoonWhitecatR.ttf")
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

# 문제 1
mpg
ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(color="blue")
## ggplot 호출에서는 어떤 데이터, 어떤 축으로 할 것인지 밑그림을 그린다.
## 어떤 그래프를 그릴 것인지 geom_으로 시작하는 함수를 통해 그래프의 모양을 추가할 수 있다.
## 테마, 텍스트, 범례의 세부사항 지정은 계속해서 + 결합으로 이루어진다.

# 도시연비와 고속도로 연비는 비례한다.
ggsave("output/result1.png") 




# 문제 2
# ggplot(mpg, aes(x=class, y=count)) + geom_col(aes(fill=drv))
ggplot(mpg, aes(x=class)) + geom_bar(aes(fill=drv))

# color를 채울때 구동방식에 대한 정보(drv)를 가지고 채웠다.
# geom_bar 자체가 x축에 주어진 각각의 변수의 값들이 몇개가 있는지 개수를 세어주기 때문에, y축에 대한 정보를 주지 않는다.


       
ggsave("output/result2.png") 



                                              
# 문제 3
log <- read.table("data/product_click.log")
ggplot(log,aes(x=V2)) + geom_bar(aes(fill=V2))
# 첫번째 열은 V1, V2 변수명을 알아서 붙여준다.


## geom_col은 x축과 y축에 대한 정보, 수치데이터 값만큼 막대를 표현해준다. 데이터를 읽어서, y축을 count로 하는데.. 가급적이면 위에 방식으로..! col은 미리 집계를 해야하고, bar은 개수를 알아서 개수를 세어준다. 
log %>% rename(count=V1)
ggplot(data=log, aes(x=V2, y=count)) + geom_col(aes(fill=V2)) 
ggsave("output/result3.png") 




# 문제 4
new_log <- log

new_log$V1 <- substring(new_log$V1,1,8)
new_log$V1 <- as.Date(new_log$V1, format = '%Y%m%d')
new_log <- new_log %>% mutate(day = weekdays(V1))

## summary라는 변수명은 워낙 자주 쓰는 함수이기 때문에 변수명을 바꿔주는게 좋을듯~!
summary <- new_log %>% group_by(day) %>% summarise(count=n()) %>% rename(요일=day,클릭수=count)

ggplot(summary, aes(x=요일, y= 클릭수)) + geom_col(aes(fill=요일)) + theme_light()


#### 요일 추출 정리하기
## (1) %A
## (2) weekdays() 함수

#### 날짜 데이터 시간 데이터 다루기
## (1) strptime()
## (2) as.date()
## (3) POSIXLT

ggsave("output/result4.png") 





# 문제 5
?treemap
data(GNI2014)
GNI2014
str(GNI2014)
treemap(GNI2014, vSize ="population", index=c("continent","iso3"), title ="전세계 인구정보",fontfamily.title = "maple", fontsize.title=20, border.col = "green") 

treemap(GNI2014,
        index = c('continent', 'iso3'), 
        vSize = 'population',
        title ="전세계 인구정보",
        fontfamily.title = "maple", 
        fontsize.title=20,
        border.col = "green")

dev.copy(png, "output/result5.png") 
dev.off()