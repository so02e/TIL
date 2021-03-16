library(dplyr)

head(airquality)

# 상관행렬
cor(airquality %>% select(Ozone,Solar.R,Wind,Temp), use="complete.obs")


# 그래프
air_n <- airquality %>% filter(!is.na(Ozone)&!is.na(Solar.R)&!is.na(Wind)&!is.na(Temp))  %>% select(Ozone,Solar.R,Wind,Temp)

# 1
pairs(air_n[, 1:4])

dev.copy(png, "output/lab20_1.png") 
dev.off()

# 2
pairs.panels(air_n, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of airquality Data")

dev.copy(png, "output/lab20_2.png") 
dev.off()


# 3
library(corrplot)
airquality2 <- airquality %>% select(Ozone,Solar.R,Wind,Temp)
aircol <- cor(airquality2, use="complete.obs")
corrplot(aircol, method="pie", type="lower", order="hclust", tl.srt=45, diag=F, addCoef.col="black")

dev.copy(png, "output/lab20_3.png") 
dev.off()

# 해석
corr.test(air_n)

# 신뢰구간
print(corr.test(air_n), short=FALSE)
## 상관관계가 없는 변수는 Solar.R과 Wind이다. 





# CASE1
library(psych)
library(MASS)
library(corrgram)
library(corrplot)

data("airquality")

str(airquality)
airquality_test <- airquality[,1:4]
airquality_test <- na.omit(airquality_test)

# 상관 계수, p-value
corr.test(airquality_test)

# p-value 0.05 이상
cor.test(airquality_test$Wind, airquality_test$Solar.R)


# 시각화 1
pairs(airquality_test)


# 시각화 2
pairs.panels(airquality_test, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot of US States Data")

# 시각화 3
corrplot(cor(airquality_test), method="pie", type="lower", order="hclust", tl.srt=45, diag=F, addCoef.col="black")

# CASE2

head(airquality)

#결측치 행 제거
airquality <- airquality[complete.cases(airquality),] # 행들을 꺼내는데 데이터 프레임을 구성하는 각 행의 모든 변수의 값이 완벽한, NA가 아닌 값들만 꺼내준다. 

#상관행렬 
air <- airquality[1:4]
air_cor <- cor(air)
air_cor 

#통계적 유의성 만족 X : Solar.R 과 Wind (p-value = 0.1835)
cor.test(air$Ozone, air$Solar.R)
cor.test(air$Ozone, air$Wind)
cor.test(air$Ozone, air$Temp)
cor.test(air$Solar.R, air$Wind)
cor.test(air$Solar.R, air$Temp)
cor.test(air$Wind, air$Temp)


#그림 1
pairs(air)

dev.copy(png, "output/lab20_1.png")
dev.off()

#그림 2
pairs.panels(air, bg='red', pch=21, hist.col='gold',
             main='Correlation Plot of airquality Data')

dev.copy(png, "output/lab20_2.png")
dev.off()

#그림 3
corrplot(air_cor, method='pie', type='lower', order='hclust', addCoef.col = 'black', tl.srt=45, diag=F)

dev.copy(png, 'output/lab20_3.png')
dev.off()

# CASE3
library(dplyr)

head(airquality)
airquality[complete.cases(airquality),]  -> airquality2
airquality2[1:4] -> airquality2
airquality2 %>% mutate_all(as.numeric) -> airquality2
pairs(airquality2)
dev.copy(png, "output/lab20-1.png")
dev.off()


cor(airquality2, use="complete.obs")-> airquality3
print(corr.test(airquality2[]), short=FALSE)
cor.test(airquality2$Wind, airquality2$Solar.R)


library(psych)
pairs.panels(airquality2, bg="red", pch=21, hist.col="gold", 
             main="Correlation Plot airquality Data")
dev.copy(png, "output/lab20-2.png")
dev.off()


library(corrplot)
corrplot(airquality3, method="pie",addCoef.col="black", type="lower", order="hclust", tl.srt=45, diag=F)
dev.copy(png, "output/lab20-3.png")
dev.off()

