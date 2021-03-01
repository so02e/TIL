# 1. 벡터
espresso <- c(4,5,3,6,5,4,7)
americano <- c(63,68,64,68,72,89,94)
latte <- c(61,70,59,71,71,92,88)

sale.Espresso <- 2*espresso
sale.Americano <- 2.5*americano
sale.Latte <-3*latte

## 일별 매출액
sale.day <- sale.Espresso + sale.Americano + sale.Latte
names(sale.day) <- c("월","화","수","목","금","토","일")
sale.day



sum(sale.day)
names(sale.day[sale.day >= mean(sale.day)])





# 2. 리스트
cafe <- list(espresso = c(4,5,3,6,5,4,7),
             americano = c(63,68,64,68,72,89,94),
             latte = c(61,70,59,71,71,92,88),
             price = c(2,2.5,3),
             menu = c('espresso','americano','latte'))

cafe
cafe$menu <- factor(cafe$menu)

names(cafe$price) <- cafe$menu

# 3. 행렬
menu <- matrix(c(4,5,3,6,5,4,7,63,68,64,68,72,89,94,61,70,59,71,71,92,88),ncol=3)
colnames(menu) <-c("Espresso","Americano","Latte")
menu

sal.espresso <- menu[,1] * 2000
sal.americano <- menu[,2] * 2500
sal.latte <- menu[,3] * 3000

sal <- matrix(c(sal.espresso,sal.americano,sal.latte),ncol=3)
colnames(sal) <-c("Espresso","Americano","Latte")
rownames(sal) <-c("월","화","수","목","금","토","일")

sal

sum(sal)
mean(sal.espresso)
mean(sal.americano)
mean(sal.latte)

sum(sal[1,])