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
# 도시연비와 고속도로 연비는 비례한다.
ggsave("output/result1.png") 




# 문제 2
ggplot(mpg, aes(x=class, y=count)) + geom_col(aes(fill=drv)) 
ggsave("output/result2.png") 



                                              
# 문제 3
log <- read.table("data/product_click.log")
log %>% rename(count=V1)
ggplot(data=log, aes(x=V2, y=count)) + geom_col(aes(fill=V2)) 
ggsave("output/result3.png") 




# 문제 4
new_log <- log

new_log$V1 <- substring(new_log$V1,1,8)
new_log$V1 <- as.Date(new_log$V1, format = '%Y%m%d')
new_log <- new_log %>% mutate(day = weekdays(V1))


summary <- new_log %>% group_by(day) %>% summarise(count=n()) %>% rename(요일=day,클릭수=count)

ggplot(summary, aes(x=요일, y= 클릭수)) + geom_col(aes(fill=요일)) + theme_light()

ggsave("output/result4.png") 





# 문제 5
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
