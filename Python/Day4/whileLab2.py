# 1부터 6사이의 두 개 난수를 추출하여 각각 pairNum1, pairNum2 에 저장하고 추출된 두 개의 숫자가 서로 다르면 값의 크기를 비교

import random

while True:
    pairNum1 = random.randint(1, 6)
    pairNum2 = random.randint(1, 6)

    if pairNum1 == pairNum2 :
        print("게임 끝")
        break # 반복문을 빠져나감 (종료)

    elif pairNum2 > pairNum1 :
        print(pairNum1, "이 ", pairNum2, "보다 작다.")

    else:
        print(pairNum1, "이 ", pairNum2, "보다 크다.")
