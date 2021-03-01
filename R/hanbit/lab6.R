install.packages("svDialogs")
library(svDialogs)

height <- dlgInput('Input height(cm)')$res
weight <- dlgInput('Input weight(kg)')$res

height <-as.numeric(height)
weight <-as.numeric(weight)

height <- height/100
bmi <- weight /(height^2)

cat('입력한 키는', height*100,'cm이고 몸무게는 ',weight,'kg 입니다. BMI는 ',bmi, "입니다.")
