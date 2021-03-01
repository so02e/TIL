sales <- c(750,740,760,680,700,710,850,890,700,720,690,730)
names(sales) <- c('1','2','3','4','5','6','7','8','9','10','11','12')
sales

# 7월
sales['7']

# 1월 + 2월
sales['1'] + sales['2']

# 정렬
sort(sales)

# 최대 매출
max(sales)
which.max(sales)

sales[which.max(sales)]

# 상반기 합
sum(sales[1:6])
