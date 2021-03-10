# 문제 1
(productlog <- read.table("data/product_click.log", header=FALSE))
(productlog2 <- table(productlog))
(logdata <- colSums(productlog2))

font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")

barplot(logdata, col=terrain.colors(10),main="세로바 그래프 실습",xlab="상품ID", ylab="클릭수", col.main="red", font.main=4, family="dog")

dev.copy(png,"output/clicklog1.png")
dev.off()



# 문제 2
(productlog <- read.table("data/product_click.log", header=FALSE))
(productlog2 <- table(productlog))
rownames(productlog2) <- as.character(rownames(productlog2))

## 행 이름을 날리기
library(stringr)
rownames(productlog2) <- str_sub(rownames(productlog2),start=9, end=10)
productlog2

(logdata2 <- rowSums(productlog2))
is.vector(logdata2)
str(logdata2)
names(logdata2)

## 동일한 행 이름 통합
names <- unique(names(logdata2))
logdata2

result <- lapply(names, function(n) unname(unlist(logdata2[names(logdata2) %in% n]))) # 구글링
names(result) <- names

result
result <- sapply(result,sum)

## pie 차트
pie(result, clockwise=F, labels=paste(as.numeric(names(result)), "-",as.numeric(names(result))+1),col=rainbow(10), main="파이그래프 실습",family="maple",col.main="blue", radius =1)

dev.copy(png,"output/clicklog2.png")
dev.off()



# 문제 3
(grade <- read.table("data/성적.txt", header=TRUE))


grade2 <- grade[,3:5]
boxplot(grade2, col=rainbow(3),axes=F)
axis(1, at=1:3, lab=names(grade2), family="maple") # x축 추가
axis(2, at=seq(2, 10, 2), family="maple") # y축 추가
title("과목별 성적 분포", family="maple", cex.main=2,col.main="orange")
box()

dev.copy(png,"output/clicklog3.png")
dev.off()



# 문제 4
grade3 <- grade[,3:5]
rownames(grade3) <- grade[,2]

grade3 <- as.matrix(grade3)

barplot(t(grade3),main = "학생별 점수", 
        col=c('orange','skyblue','pink'),
        beside=FALSE,
        family="dog",
        col.main="violet",
        cex.main = 2,
        legend.text = c("국어", "수학", "영어") )


dev.copy(png,"output/clicklog4.png")
dev.off()




# p. 342 자동차 데이터 상자그림 분석
boxplot(mtcars$mpg)
boxplot(mtcars$mpg~mtcars$gear)
boxplot(mtcars$mpg~mtcars$vs)
boxplot(mtcars$mpg~mtcars$am)

grp <- rep('high', nrow(mtcars))
grp[mtcars$wt<mean(mtcars$wt)] <- 'low'
boxplot(mtcars$hp~grp)

