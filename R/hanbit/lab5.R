brand <- c('M','L',"B")
kcal <- c(514,533,566)
na <- c(917,853,888)
fat <- c(11,13,10)
menu <- c('shrimp','meat','chicken')


burger <- data.frame(kcal,na,fat,menu)
burger


# 행 이름을 브랜드 명으로 설정
rownames(burger) <- brand
burger


burger['M',]
burger['M','kcal']
