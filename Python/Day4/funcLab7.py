# 1부터 30 사이의 난수 2 개를 추출하여 차를 추출하고, 이를 5번 반복한다.
def differtwovalue (num1, num2):
    if num1 == num2:
        return (0)
    else :
        return(abs(num1-num2))

import random

for i in range(1,6):
    rand1 = random.randint(1,30)
    rand2 = random.randint(1,30)
    print(rand1, "와 ", rand2, "의 차는 ", differtwovalue(rand1,rand2), "입니다.")
    i+=1